import 'package:flutter/material.dart';

class SearchScreenCopy extends StatefulWidget {
  const SearchScreenCopy({super.key});

  @override
  State<SearchScreenCopy> createState() => _SearchScreenCopyState();
}

class _SearchScreenCopyState extends State<SearchScreenCopy> {
  List<String> searchResult = [];
  List<String> list = [
    "kozhikode",
    "kannur",
    "kasarkode",
    "Thrissur",
    "Ernakulam",
  ];
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Search for a place"),
        ),
        body: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              onChanged: (value) {
                setState(() {
                  searchResult =
                      list.where((element) => element.toLowerCase().contains(value.toLowerCase())).toList();
                });
                print(searchResult.toString());
              },
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
