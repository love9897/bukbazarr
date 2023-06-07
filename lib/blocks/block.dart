import 'package:bukbazarr/datamodal/booksmod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreenState {
  final List<booksmod> searchResults;

  SearchScreenState({required this.searchResults});

  SearchScreenState.initial() : searchResults = [];

  SearchScreenState copyWith({List<booksmod>? searchResults}) {
    return SearchScreenState(
      searchResults: searchResults ?? this.searchResults,
    );
  }
}

abstract class SearchScreenEvent {}

class SearchScreenTextChanged extends SearchScreenEvent {
  final String searchText;

  SearchScreenTextChanged({required this.searchText});
}

class SearchScreenResultsUpdated extends SearchScreenEvent {
  final List<booksmod> results;

  SearchScreenResultsUpdated({required this.results});
}

class SearchScreenBloc extends Bloc<SearchScreenEvent, SearchScreenState> {
  SearchScreenBloc() : super(SearchScreenState.initial()) {
    on<SearchScreenTextChanged>(_onSearchScreenTextChanged);
  }

  Future<void> _onSearchScreenTextChanged(
      SearchScreenTextChanged event, Emitter<SearchScreenState> emit) async {
    final results = await _fetchSearchResults(event.searchText);
    emit(state.copyWith(searchResults: results));
  }

  Future<List<booksmod>> _fetchSearchResults(String searchText) async {
    final apiUrl =
        'https://www.googleapis.com/books/v1/volumes?q=$searchText&key=AIzaSyDSgCrrp3kzPwmeNtuNG-sjCh1_MMfPoqc';

    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final items = data['items'] as List<dynamic>;
      return items.map((item) => booksmod.fromJson(item)).toList();
    } else {
      // Handle API error
      print('API request failed with status code ${response.statusCode}');
      return [];
    }
  }
}
