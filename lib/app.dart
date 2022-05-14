// ignore_for_file: prefer_const_constructors

import 'package:dropdown_search/views/typehead_search_field.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TypeHeadSearchField(),
    );
  }
}
