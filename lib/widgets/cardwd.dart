// import 'dart:io';

// import 'package:bukbazarr/provider/Booksprovider.dart';

import 'package:bukbazarr/screens/bookdetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/firebaseprovider.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';

// import '../datamodal/booksmodal.dart';

class BookCard extends StatefulWidget {
  const BookCard({super.key});

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  // Future<Booksmodal> fetchBooks() async {
  //   return StreamBuilder<QuerySnapshot>(
  //     stream: FirebaseFirestore.instance.collection('books').snapshots(),
  //     builder: (context, snapshot) {
  //       if(snapshot.hasError){
  //         return Text('Error: ${snapshot.error}');
  //       }
  //       final data = snapshot.data?docs ??[];
  //     },
  //   ),
  // }

  @override
  Widget build(BuildContext context) {
    final book = Provider.of<GetData>(context);

    return FutureBuilder<List<DocumentSnapshot>>(
        future: book.getDataFromFirestore(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data ?? [];

            return SingleChildScrollView(
              child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0,
                      mainAxisExtent: 280),
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, index) {
                    final item = data[index].data() as Map<String, dynamic>;

                    final double rating = double.parse(
                        item["volumeInfo"]['averageRating'].toString() ??
                            '1.0');
                    final String imageurl =
                        item['volumeInfo']['imageLinks']['thumbnail'];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookDetailsScreen(book: item),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black12,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0),
                                ),
                                child: imageurl == ''
                                    ? Image.asset(
                                        'image/place.png',
                                        height: 160,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.network(
                                        imageurl,
                                        height: 160,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['volumeInfo']['title'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .merge(
                                            const TextStyle(
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                    ),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    Text(
                                      "By: " +
                                          item['volumeInfo']['authors']
                                              .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .merge(
                                            TextStyle(
                                              fontWeight: FontWeight.w700,
                                              // color: Colors.grey.shade500,
                                            ),
                                          ),
                                    ),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "INR",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .merge(
                                                TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  // color: Colors.grey.shade500,
                                                ),
                                              ),
                                        ),
                                        Text(
                                          item['saleInfo']['listPrice']
                                                  ['amount']
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .merge(
                                                TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  // color: Colors.grey.shade500,
                                                ),
                                              ),
                                        ),
                                        const SizedBox(
                                          width: 8.0,
                                        ),
                                        RatingBarIndicator(
                                          rating: rating,
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 12.0,
                                          direction: Axis.horizontal,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
