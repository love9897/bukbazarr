import 'package:bukbazarr/provider/bookmarkProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookmarkedPage extends StatefulWidget {
  const BookmarkedPage({super.key});

  @override
  State<BookmarkedPage> createState() => _BookmarkedPageState();
}

class _BookmarkedPageState extends State<BookmarkedPage> {
  @override
  Widget build(BuildContext context) {
    // final bookmarksProvider = Provider.of<BookmarksProvider>(context);
    // final List<Book> bookmarks = bookmarksProvider.bookmarks;
    // final Map<String, dynamic>? listbook =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final bookmarksProvider = Provider.of<BookmarksProvider>(context);
    final List<Map<String, dynamic>> bookmarks = bookmarksProvider.bookmarks;
    return Scaffold(
      body: bookmarks.isEmpty
          ? Center(
              child: Image.asset(
                'image/empty.png',
                width: 300,
                height: 300,
              ),
            )
          : ListView.builder(
              itemCount: bookmarks.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> book = bookmarks[index];
                return ListTile(
                  leading: Image.network(
                    book['volumeInfo']['imageLinks']['thumbnail'],
                  ),
                  title: Text(book['volumeInfo']['title']),
                  subtitle: Text(book['volumeInfo']['authors']),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: () {
                      // bookmarkProvider.removeBookmark(bookmark);
                    },
                  ),
                );
              }),
    );
  }
}
