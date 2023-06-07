import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

// // class BookDetailsScreen extends StatelessWidget {
// //   final Map<String, dynamic> book;

// //   BookDetailsScreen({required this.book});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Center(child: Text('Title: ${book['volumeInfo']['description']}')),
// //             // Text('Author: ${book['authors']}'),
// //             // Text('Description: ${book['description']}'),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// class BookDetailsScreen extends StatelessWidget {
//   final Map<String, dynamic> book;

//   BookDetailsScreen({required this.book});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Color(0xff737373).withOpacity(0),
//       child: Container(
//         padding: EdgeInsets.all(30),
//         width: double.infinity,
//         margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(32.0),
//             topRight: Radius.circular(32.0),
//           ),
//         ),
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 8.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Card(
//                             child: Container(
//                               color: Colors.lightBlueAccent,
//                               child: const Padding(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 16.0, vertical: 2.0),
//                                 child: Text(
//                                   'Rank',
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                             book['volumeInfo']['authors'].toString(),
//                             style:
//                                 TextStyle(fontSize: 12.0, color: Colors.teal),
//                           ),
//                           SizedBox(height: 5),
//                           Text(
//                             book['volumeInfo']['title'],
//                             softWrap: true,
//                             style: GoogleFonts.montserrat(
//                                 textStyle: TextStyle(
//                                     fontSize: 18.0,
//                                     fontWeight: FontWeight.bold)),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Container(
//                     width: MediaQuery.of(context).size.height * 0.15,
//                     height: MediaQuery.of(context).size.height * 0.2,
//                     child: Card(
//                       elevation: 10.0,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(8),
//                         ),
//                       ),
//                       child: GestureDetector(
//                         onTap: () {
//                           // Navigator.of(context).pushNamed(),
//                         },
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(8),
//                           child: Image.network(
//                             book['volumeInfo']['imageLinks']['thumbnail'],
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               Divider(),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       'DESCRIPTION',
//                       style: TextStyle(
//                           color: Colors.teal,
//                           fontSize: 12.0,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       height: 5.0,
//                     ),
//                     Expanded(
//                         child: Container(
//                       width: double.infinity,
//                       child: SingleChildScrollView(
//                         child: Text(
//                           book['volumeInfo']['description'] == ''
//                               ? 'Not Available'
//                               : book['volumeInfo']['description'],
//                           style: GoogleFonts.notoSans(
//                               textStyle: TextStyle(
//                             fontSize: 14.0,
//                             letterSpacing: 0.2,
//                           )),
//                         ),
//                       ),
//                     ))
//                   ],
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Column(
//                     children: [
//                       Text(
//                         'Publisher: ',
//                         softWrap: true,
//                         style: TextStyle(
//                             color: Colors.teal,
//                             fontSize: 12.0,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       Container(
//                         width: 100,
//                         child: Text(
//                           ' ${book['volumeInfo']['publisher']}'.trim(),
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                               fontSize: 14, fontWeight: FontWeight.bold),
//                           softWrap: true,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Row(
//                 children: <Widget>[
//                   GestureDetector(
//                     onTap: () {},
//                     child: SizedBox(
//                       child: Icon(FeatherIcons.dollarSign),
//                       height: 32,
//                       width: 32,
//                     ),
//                   ),
//                   SizedBox(width: 20),
//                 ],
//               )
//             ]),
//       ),
//     );
//   }
// }

class BookDetailsDoc extends StatelessWidget {
  final DocumentSnapshot book;

  BookDetailsDoc({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
          child: Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(8.0),
                        ),
                        child: Image.network(
                          book['volumeInfo']['imageLinks']['thumbnail'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' ${book['volumeInfo']['title']}',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            textAlign: TextAlign.start,
                            '${book['volumeInfo']['authors']}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Publish By: ${book['volumeInfo']['publisher']}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              SizedBox(width: 4.0),
                              Text(
                                book['volumeInfo']['averageRating']
                                            .toString() ==
                                        'null'
                                    ? ''
                                    : book['volumeInfo']['averageRating']
                                        .toString(),
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.0),
                      Text(
                        'Description:',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        book['volumeInfo']['description'] == null
                            ? 'Not Available'
                            : book['volumeInfo']['description'],
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Total Pages: ${book['volumeInfo']['pageCount']}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.bookmark),
                          onPressed: () {
                            // Handle bookmark button press
                          },
                        ),
                        ElevatedButton(
                          child: Text('Buy Book'),
                          onPressed: () {
                            // Handle buy book button press
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
