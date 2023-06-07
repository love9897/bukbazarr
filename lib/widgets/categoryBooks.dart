import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../screens/bookdetails.dart';
import '../screens/bookdetailsDoc.dart';

class BookGridPage extends StatelessWidget {
  final String category;

  BookGridPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('category')
            .doc('category')
            .collection('$category')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error occurred.'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No books available for this category.'),
            );
          }

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
                mainAxisExtent: 280),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot document = snapshot.data!.docs[index];
              String title = document['volumeInfo']['title'];
              String author = document['volumeInfo']['authors'].toString();
              String imageurl =
                  document['volumeInfo']['imageLinks']['thumbnail'];
              // String imageUrl = document['image'];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookDetailsDoc(book: document),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                            child: imageurl == '' && imageurl == null
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
                                  title,
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
                                  "By: " + author,
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
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
