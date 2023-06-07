import 'package:flutter/material.dart';

class BookmarksProvider extends ChangeNotifier {
  List<Map<String, dynamic>> bookmarks = [];

  void toggleBookmark(String title, Map<String, dynamic> bookDetails) {
    bool bookmarked = isBookmarked(title);

    if (bookmarked) {
      removeBookmark(title);
    } else {
      addBookmark(title, bookDetails);
    }

    notifyListeners();
  }

  void addBookmark(String title, Map<String, dynamic> bookDetails) {
    bookmarks.add({
      'title': title,
      'details': bookDetails,
    });
  }

  void removeBookmark(String title) {
    bookmarks.removeWhere((bookmark) => bookmark['title'] == title);
  }

  bool isBookmarked(String title) {
    return bookmarks.any((bookmark) => bookmark['title'] == title);
  }
}
