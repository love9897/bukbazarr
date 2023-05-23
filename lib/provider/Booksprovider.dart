import 'dart:convert';
import 'package:bukbazarr/datamodal/booksmodal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Booksprovider with ChangeNotifier {
  // static const String url =
  //     "https://www.googleapis.com/books/v1/volumes?q=Books+price&key=AIzaSyDSgCrrp3kzPwmeNtuNG-sjCh1_MMfPoqc";

  // static List<Booksmodal> parseData(String responseBody) {
  //   var list = json.decode(responseBody) as List<dynamic>;
  //   List<Booksmodal> data = list.map((e) => Booksmodal.fromJson(e)).toList();
  //   return data;
  // }
  static Future<List<Booksmodal>> fetchBooks() async {
    final url = 'https://www.googleapis.com/books/v1/volumes?q=flutter'; // Replace with your desired search query or API endpoint URL

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final itemsData = jsonData['items'];

      return List<Booksmodal>.from(itemsData.map((itemData) {
        final volumeInfo = itemData['volumeInfo'];
        

        return Booksmodal(
          items: volumeInfo,

          
          
          
          

          // title: volumeInfo['title'],
          // author: volumeInfo['authors'][0],
          // imageUrl: volumeInfo['imageLinks']['thumbnail'],
        );
      }));
    } else {
      throw Exception('Failed to fetch books');
    }
    
  }

  // @override
  // void notifyListeners() {
  //   // TODO: implement notifyListeners
  //   super.notifyListeners();
  //   fetchBooks();
  // }

  // static fetchBooks() async {
  //   final response = await http.get(Uri.parse(url));
  //   if (response.statusCode == 200) {
  //     return compute(parseData, response.body);
  //   } else {
  //     throw Exception('Cant get data');
  //   }
  // }
  // Future<void> storeBooks() async {
  //   final books = await fetchBooks();

  //   for (var book in books) {
  //     await FirebaseFirestore.instance.collection('books').add({
  //       'title': book,
  //       'author': book.author,
  //       'rating': book.rating,
  //     });
  //   }
  //   notifyListeners();
  // }
}
