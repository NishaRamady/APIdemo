import 'dart:convert';

import 'package:apidemo/apitask.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiSearchScreen2 extends StatefulWidget {
  const ApiSearchScreen2({super.key});

  @override
  State<ApiSearchScreen2> createState() => _ApiSearchScreen2State();
}

class _ApiSearchScreen2State extends State<ApiSearchScreen2> {
  List<String> searchResult = [];
  List<String> category = [
    "men's clothing",
    "women's clothing",
    "electronics",
    "jewelery",
  ];
  TextEditingController searchController = TextEditingController();
  Future apicall() async {
    http.Response response;
    response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      setState(() {
        listResponse = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  List getFilteredItems(String selectedCategory) {
    return listResponse != null
        ? List.from(listResponse!)
            .where((item) => item['category']
                .toLowerCase()
                .contains(selectedCategory.toLowerCase()))
            .toList()
        : [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API search Demo"),
      ),
      body: Column(
        children: [
          TextField(
            controller: searchController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onChanged: (value) {
              setState(() {
                searchResult = category
                    .where((element) => element.contains(value))
                    .toList();
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResult.isEmpty
                  ? 0
                  : getFilteredItems(searchResult.first).length,
              itemBuilder: (context, index) {
                var filteredItems = getFilteredItems(searchResult.first);
                return Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.network(filteredItems[index]['image']),
                        Text(filteredItems[index]['id'].toString()),
                        Text(filteredItems[index]['title'].toString()),
                        Text(filteredItems[index]['price'].toString()),
                        Text(filteredItems[index]['description'].toString()),
                        Text(filteredItems[index]['category'].toString()),
                        Text(filteredItems[index]['rating'].toString()),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
