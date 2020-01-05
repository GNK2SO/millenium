import 'package:flutter/material.dart';

class Search extends SearchDelegate<String> {
  @override
  String get searchFieldLabel => "Digite o nome...";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    Future.delayed(Duration.zero).then(
        (_) => query.isEmpty ? close(context, null) : close(context, query));
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
