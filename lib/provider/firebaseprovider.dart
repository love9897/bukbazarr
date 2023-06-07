import 'dart:convert';

import 'package:bukbazarr/datamodal/booksmod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import '../datamodal/booksmodal.dart';

class GetData with ChangeNotifier {
  Future<List<DocumentSnapshot>> getDataFromFirestore() async {
    final QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('books').get();
    return querySnapshot.docs;
  }

  List<booksmod> _searchResults = [];

  List<booksmod> get searchResults => _searchResults;

  Future<void> fetchBooks(String search) async {
    final response = await http.get(Uri.parse(
        'https://www.googleapis.com/books/v1/volumes?q=$search&key=AIzaSyDSgCrrp3kzPwmeNtuNG-sjCh1_MMfPoqc'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final items = data['items'] as List<dynamic>;
      _searchResults = items.map((item) => booksmod.fromJson(item)).toList();
    } else {
      // Handle API error
      print('API request failed with status code ${response.statusCode}');
    }

    notifyListeners();
  }
}



// import 'dart:io';

// import 'package:bukbazarr/provider/Booksprovider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';

// import '../datamodal/booksmodal.dart';

// class BookCard extends StatefulWidget {
//   @override
//   State<BookCard> createState() => _BookCardState();
// }

// class _BookCardState extends State<BookCard> {
  

  

//   @override
//   Widget build(BuildContext context) {
//     // final book = Provider.of<Booksprovider>(context);

//     return FutureBuilder<Booksmodal>(
//         future: fetchBooks(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final data = snapshot.data;
//             final CollectionReference dataCollection =
//                 FirebaseFirestore.instance.collection('Books');

// // Store the data in Firestore
//             dataCollection.add(data!.items!.toList());
//             return SingleChildScrollView(
//               child: GridView.builder(
//                   physics: NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 12.0,
//                       mainAxisSpacing: 12.0,
//                       mainAxisExtent: 280),
//                   itemCount: data!.items!.length,
//                   itemBuilder: (BuildContext context, index) {
//                     final rating =
//                         data.items![index].volumeInfo!.averageRating.toString();
//                     final String? imageurl =
//                         data.items![index].volumeInfo!.imageLinks?.thumbnail;

//                     return Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.black26,
//                       ),
//                       child: SingleChildScrollView(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             ClipRRect(
//                               borderRadius: const BorderRadius.only(
//                                 topLeft: Radius.circular(16.0),
//                                 topRight: Radius.circular(16.0),
//                               ),
//                               child: imageurl == null
//                                   ? Image.asset(
//                                       'image/place.png',
//                                       height: 160,
//                                       width: double.infinity,
//                                       fit: BoxFit.cover,
//                                     )
//                                   : Image.network(
//                                       imageurl,
//                                       height: 160,
//                                       width: double.infinity,
//                                       fit: BoxFit.cover,
//                                     ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     data.items![index].volumeInfo!.title
//                                         .toString(),
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .titleMedium!
//                                         .merge(
//                                           const TextStyle(
//                                             fontWeight: FontWeight.w700,
//                                           ),
//                                         ),
//                                   ),
//                                   const SizedBox(
//                                     height: 8.0,
//                                   ),
//                                   Text(
//                                     "By: " +
//                                         data.items![index].volumeInfo!.authors
//                                             .toString(),
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .titleSmall!
//                                         .merge(
//                                           TextStyle(
//                                             fontWeight: FontWeight.w700,
//                                             // color: Colors.grey.shade500,
//                                           ),
//                                         ),
//                                   ),
//                                   const SizedBox(
//                                     height: 8.0,
//                                   ),
//                                   Row(
//                                     children: [
//                                       Text(
//                                         "INR",
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .titleSmall!
//                                             .merge(
//                                               TextStyle(
//                                                 fontWeight: FontWeight.w700,
//                                                 // color: Colors.grey.shade500,
//                                               ),
//                                             ),
//                                       ),
//                                       Text(
//                                         data.items![index].saleInfo!.listPrice
//                                                 ?.amount
//                                                 .toString() ??
//                                             "",
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .titleSmall!
//                                             .merge(
//                                               TextStyle(
//                                                 fontWeight: FontWeight.w700,
//                                                 // color: Colors.grey.shade500,
//                                               ),
//                                             ),
//                                       ),
//                                       const SizedBox(
//                                         width: 8.0,
//                                       ),
//                                       // RatingBarIndicator(
//                                       //   rating: rating,
//                                       //   itemBuilder: (context, index) => Icon(
//                                       //     Icons.star,
//                                       //     color: Colors.amber,
//                                       //   ),
//                                       //   itemCount: 5,
//                                       //   itemSize: 20.0,
//                                       //   direction: Axis.horizontal,
//                                       // ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     );
//                   }),
//             );
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else {
//             return CircularProgressIndicator();
//           }
//         });
//   }
// }
