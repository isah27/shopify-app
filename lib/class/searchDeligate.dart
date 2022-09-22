import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shopify/widgets/normal_text.dart';

class CustomSearchDeligate extends SearchDelegate {
  List<String> searchTerms = [
    'Apple',
    'Shoes',
    'Bag',
    'Shirt',
    'Food',
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in searchTerms) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index] + index.toString();
          return GestureDetector(
            onTap: () {
              log(result);
            },
            child: ListTile(
              title: NormalText(text: "result", size: 15),
            ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in searchTerms) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return GestureDetector(
            onTap: () {
              log(result);
            },
            child: ListTile(
              title: NormalText(text: result, size: 15),
            ),
          );
        });
  }
}
