import 'package:apidemo/model/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class ApiSearchScreen extends StatefulWidget {
  const ApiSearchScreen({super.key});

  @override
  State<ApiSearchScreen> createState() => _ApiSearchScreenState();
}

class _ApiSearchScreenState extends State<ApiSearchScreen> {
  List<ProductModel> listResponse = [];
  List<ProductModel> searchResult = [];
 
  TextEditingController searchController = TextEditingController();
  Future apicall() async {
    try {
      http.Response response;
      response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
      if (response.statusCode == 200) {
        setState(() {
          listResponse = productModelFromJson(response.body);
        });
      }
    } catch (e) {
      print(e);
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
          title: const Text("API search Demo"),
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
                  searchResult = listResponse
                      .where((element) =>
                          element.title.toLowerCase().contains(value.toLowerCase()))
                      .toList();
                });
              },
            ),
            //8921096924
             searchResult.isEmpty ?
               Expanded(
              child: ListView.builder(
                itemCount: listResponse.length ,
                itemBuilder: (context, index) {
                  return ListTile(
                    title:Image.network(listResponse[index].image),
                    subtitle: Column(
                      children: [
                        Text(listResponse[index].title.toString()),
                          Text(listResponse[index].description.toString()),
                          Text(listResponse[index].price.toString()),
                      ],
                    ),
                    leading:  Text(listResponse[index].id.toString()),
                    trailing: Text(listResponse[index].category.toString()),
                  );
                },
              ),
            )
            :
            Expanded(
              child: ListView.builder(
                itemCount:  searchResult.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title:Image.network(searchResult[index].image),
                    subtitle: Column(
                      children: [
                        Text(searchResult[index].title.toString()),
                          Text(searchResult[index].description.toString()),
                          Text(searchResult[index].price.toString()),
                      ],
                    ),
                    leading:  Text(searchResult[index].id.toString()),
                    trailing: Text(searchResult[index].category.toString()),
                  );
                },
              ),
            )
          ],
        ));
  }
}
