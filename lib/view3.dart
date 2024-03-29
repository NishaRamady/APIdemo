// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// String? stringResponse;
// Map? mapResponse;
// Map? dataResponse;
// List? listResponse;

// class ApiDemoScreen extends StatefulWidget {
//   const ApiDemoScreen({super.key});

//   @override
//   State<ApiDemoScreen> createState() => _ApiDemoScreenState();
// }

// class _ApiDemoScreenState extends State<ApiDemoScreen> {
//   Future apicall() async {
//     http.Response response;
//     response = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
//     if (response.statusCode == 200) {
//       setState(() {
//         // stringResponse = response.body;
//         mapResponse = json.decode(response.body);
//          //  dataResponse = mapResponse!['support'];
//         listResponse = mapResponse!['data'];
       
//       });
//     }
//   }

//   @override
//   void initState() {
//     apicall();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("API Demo"),
//       ),
//       body: ListView.builder(
//         itemCount:listResponse == null
//         ?0
//         :listResponse!.length,
//         itemBuilder: (context, index) {
//           return Container(
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Image.network(listResponse![index]['avatar']),
//                 ),
//                 Text(listResponse![index]['id'].toString()),
//                 Text(listResponse![index]['email'].toString()),
//                 Text(listResponse![index]['first_name'].toString()),
//                 Text(listResponse![index]['last_name'].toString()),
//               ],
//             ),
//           );
//         },)
//     );
//   }
// }
