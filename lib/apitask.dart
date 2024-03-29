import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// String? stringResponse;
// Map? mapResponse;
// Map? dataResponse;
List? listResponse;

class ApiDemoScreen extends StatefulWidget {
  const ApiDemoScreen({super.key});

  @override
  State<ApiDemoScreen> createState() => _ApiDemoScreenState();
}

class _ApiDemoScreenState extends State<ApiDemoScreen> {
  Future apicall() async {
    http.Response response;
    response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      setState(() {
        // stringResponse = response.body;
        listResponse = json.decode(response.body);
         //  dataResponse = mapResponse!['support'];
        // listResponse = mapResponse!['data'];
       
      });
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Demo"),
      ),
      body: ListView.builder(
        itemCount:listResponse == null
        ?0
        :listResponse!.length,
        itemBuilder: (context, index) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.network(listResponse![index]['image']),
                  Text(listResponse![index]['id'].toString()),
                   Text(listResponse![index]['title'].toString()),
                   Text(listResponse![index]['price'].toString()),
                    Text(listResponse![index]['description'].toString()),
                   Text(listResponse![index]['category'].toString()),
                    Text(listResponse![index]['rating'].toString()),
                ],
              ),
            ),
          );
        },)
    );
  }
}
