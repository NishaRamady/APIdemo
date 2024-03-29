import 'package:apidemo/apisearch.dart';
import 'package:apidemo/apitask.dart';
import 'package:apidemo/apitasksearch.dart';
import 'package:apidemo/searchbar.dart';
import 'package:apidemo/searchbarcopy.dart';
import 'package:apidemo/view.dart';
import 'package:apidemo/view2.dart';
import 'package:apidemo/view3.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: ApiDemoScreen(),
        //  home: ApiSearchScreen(),
      // home:SearchBarApp(),
      //  home:SearchScreen(),
      // home: SearchScreenCopy(),
    );
  }
}
