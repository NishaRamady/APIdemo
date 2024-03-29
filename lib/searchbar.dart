import 'dart:developer';

import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> searchResult = [];
  List<String> list = ['apple', 'orange', 'grapes', 'pineapple', 'banana'];
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Search for an item")),
        body: Column(
            children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
                controller: searchController,
                onChanged: (value) {
                  setState(() {
                    searchResult =
                        list.where((element) => element.contains(value)).toList();
                  });
                    
                   log(searchResult.toString());
                  // print(value);
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: searchResult.length,
                itemBuilder: (context, index) {
                  return ListTile(
                  title:Text(searchResult[index]));
                },
              ),
            )
          ],
        ));
  }
}



