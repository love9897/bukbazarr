// // import 'package:bukbazarr/datamodal/booksmodal.dart';
// import 'package:bukbazarr/provider/firebaseprovider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// import 'package:provider/provider.dart';
// // import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// // class SearchScreenState {
// //   final List<Booksmodal> searchResults;

// //   SearchScreenState({required this.searchResults});

// //   factory SearchScreenState.initial() {
// //     return SearchScreenState(searchResults: []);
// //   }
// // }

// // abstract class SearchScreenEvent {}

// // class SearchScreenTextChanged extends SearchScreenEvent {
// //   final String searchText;

// //   SearchScreenTextChanged({required this.searchText});
// // }

// // class SearchScreenResultsUpdated extends SearchScreenEvent {
// //   final List<Booksmodal> results;

// //   SearchScreenResultsUpdated({required this.results});
// // }

// // class SearchScreenBloc extends Bloc<SearchScreenEvent, SearchScreenState> {
// //   SearchScreenBloc() : super(SearchScreenState.initial());

// //   Stream<SearchScreenState> mapEventToState(SearchScreenEvent event) async* {
// //     if (event is SearchScreenTextChanged) {
// //       yield* _mapSearchScreenTextChangedToState(event.searchText);
// //     }
// //   }

// //   Stream<SearchScreenState> _mapSearchScreenTextChangedToState(
// //       String searchText) async* {
// //     yield SearchScreenState(searchResults: []);

// //     if (searchText.isEmpty) {
// //       return;
// //     }

// //     final results = await _fetchSearchResults(searchText);
// //     yield SearchScreenState(searchResults: results);
// //   }
// // class SearchProvider with ChangeNotifier {
// //   List<Booksmodal> _searchResults = [];

// //   List<Booksmodal> get searchResults => _searchResults;

// //   Future<void> fetchSearchResults(String searchText) async {
// //     final apiUrl =
// //         'https://www.googleapis.com/books/v1/volumes?q=$searchText&key=AIzaSyDSgCrrp3kzPwmeNtuNG-sjCh1_MMfPoqc';

// //     final response = await http.get(Uri.parse(apiUrl));
// //    if (response.statusCode == 200) {
// //       final data = json.decode(response.body);
// //       final items = data['items'] as List<dynamic>;
// //       _searchResults = items.map((item) => SearchResult.fromJson(item)).toList();
// //     } else {
// //       // Handle API error
// //       print('API request failed with status code ${response.statusCode}');
// //     }
// //     notifyListeners();
// //   }
// // }

// class Search extends StatefulWidget {
//   const Search({super.key});

//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<Search> {
//   final TextEditingController _searchController = TextEditingController();

//   // late SearchScreenBloc blocs;

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   blocs = SearchScreenBloc();
//   // }

//   // @override
//   // void dispose() {
//   //   blocs.close();
//   //   _searchController.dispose();
//   //   super.dispose();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     final books = Provider.of<GetData>(context);

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               margin: EdgeInsets.all(18),
//               height: 50,
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Row(
//                 children: [
//                   SizedBox(width: 10),
//                   Icon(Icons.search, color: Colors.grey),
//                   SizedBox(width: 10),
//                   Expanded(
//                     child: TextField(
//                       controller: _searchController,
//                       onSubmitted: (text) {
//                         books.fetchBooks(text);
//                       },
//                       decoration: InputDecoration(
//                         hintText: 'Search',
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Consumer<GetData>(builder: (context, value, child) {
//               final Results = value.searchResults;
//               // print(Results.length);

//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: SingleChildScrollView(
//                   child: GridView.builder(
//                     physics: NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             crossAxisSpacing: 12.0,
//                             mainAxisSpacing: 12.0,
//                             mainAxisExtent: 280),
//                     itemCount: Results.length,
//                     itemBuilder: (BuildContext context, index) {
//                       final result = Results[index];

//                       final String? imageurl =
//                           result.volumeInfo?.imageLinks?.thumbnail;

//                       return Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: Colors.black26,
//                         ),
//                         child: SingleChildScrollView(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               ClipRRect(
//                                 borderRadius: const BorderRadius.only(
//                                   topLeft: Radius.circular(16.0),
//                                   topRight: Radius.circular(16.0),
//                                 ),
//                                 child: imageurl == null
//                                     ? Image.asset(
//                                         'image/place.png',
//                                         height: 160,
//                                         width: double.infinity,
//                                         fit: BoxFit.cover,
//                                       )
//                                     : Image.network(
//                                         imageurl,
//                                         height: 160,
//                                         width: double.infinity,
//                                         fit: BoxFit.cover,
//                                       ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       maxLines: 2,
//                                       result.volumeInfo!.title ?? '',
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .titleMedium!
//                                           .merge(
//                                             const TextStyle(
//                                               fontWeight: FontWeight.w700,
//                                             ),
//                                           ),
//                                     ),
//                                     const SizedBox(
//                                       height: 8.0,
//                                     ),
//                                     Text(
//                                       maxLines: 2,
//                                       "By: ${result.volumeInfo!.authors ?? ''}",
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .titleSmall!
//                                           .merge(
//                                             TextStyle(
//                                               fontWeight: FontWeight.w700,
//                                               // color: Colors.grey.shade500,
//                                             ),
//                                           ),
//                                     ),
//                                     const SizedBox(
//                                       height: 8.0,
//                                     ),
//                                     Row(
//                                       children: [
//                                         Text(
//                                           "INR",
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .titleSmall!
//                                               .merge(
//                                                 TextStyle(
//                                                   fontWeight: FontWeight.w700,
//                                                   // color: Colors.grey.shade500,
//                                                 ),
//                                               ),
//                                         ),
//                                         const SizedBox(
//                                           width: 8.0,
//                                         ),
//                                         RatingBarIndicator(
//                                           rating: 3,
//                                           itemBuilder: (context, index) => Icon(
//                                             Icons.star,
//                                             color: Colors.amber,
//                                           ),
//                                           itemCount: 5,
//                                           itemSize: 12.0,
//                                           direction: Axis.horizontal,
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               );
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }
