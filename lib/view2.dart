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
//         listResponse = mapResponse!['data'];
//         //  dataResponse = mapResponse!['support'];
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
//       body: Center(
//         child: Container(
//           decoration: BoxDecoration(
//               color: Colors.blue[200],
//               borderRadius: const BorderRadius.all(Radius.circular(15))),
//           width: 380,
//           height: 300,
//           child: Center(
//               // child: mapResponse == null
//               child: listResponse == null
//                   ? Container() //Text("data is loading")
//                   : Text(
//                       // stringResponse.toString(),  // to get the whole response
//                       // mapResponse!['data']   //to get the  individual data response
//                       // listResponse![0] //to get the first list inside the data response
//                       listResponse![0]['first_name']
//                           .toString(),
//                       // mapResponse!['support'].toString(), // to get the individual "support" response

//                       style: const TextStyle(fontSize: 16),
//                     )),
//         ),
//       ),
//     );
//   }
// }
