

import 'package:flutter/material.dart';

class SearchMovieDelegate extends SearchDelegate {

  @override
  String get searchFieldLabel => 'Search movie';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      const Text(
        'Actions',
        style: TextStyle()
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return const Text(
        'Leading',
        style: TextStyle()
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text(
        'Results',
        style: TextStyle()
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Text(
        'Suggestions',
        style: TextStyle()
    );
  }
  
  
}