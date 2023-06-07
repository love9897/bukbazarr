import 'package:bukbazarr/blocks/block.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchScreenBloc(), // Provide your Bloc instance
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        home: SearchScreen(), // Use your screen that uses the Bloc
      ),
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  late SearchScreenBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = SearchScreenBloc();
  }

  @override
  void dispose() {
    _bloc.close();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchScreenBloc, SearchScreenState>(
      bloc: _bloc,
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(children: [
              Container(
                margin: EdgeInsets.all(18),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        onSubmitted: (text) {
                          _bloc.add(SearchScreenTextChanged(searchText: text));
                        },
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 616,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12.0,
                              mainAxisSpacing: 12.0,
                              mainAxisExtent: 280),
                      itemCount: state.searchResults.length,
                      itemBuilder: (BuildContext context, index) {
                        final result = state.searchResults[index];

                        final String? imageurl =
                            result.volumeInfo?.imageLinks?.thumbnail;

                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black26,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16.0),
                                    topRight: Radius.circular(16.0),
                                  ),
                                  child: imageurl == null
                                      ? Image.asset(
                                          'image/place.png',
                                          height: 180,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.network(
                                          imageurl,
                                          height: 180,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        maxLines: 2,
                                        result.volumeInfo!.title ?? '',
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
                                        maxLines: 2,
                                        "By: ${result.volumeInfo!.authors.toString() ?? ''}",
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
                                          const SizedBox(
                                            width: 8.0,
                                          ),
                                          // RatingBarIndicator(
                                          //   rating: 3,
                                          //   itemBuilder: (context, index) =>
                                          //       Icon(
                                          //     Icons.star,
                                          //     color: Colors.amber,
                                          //   ),
                                          //   itemCount: 5,
                                          //   itemSize: 12.0,
                                          //   direction: Axis.horizontal,
                                          // ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
