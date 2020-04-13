import 'package:flutter/material.dart';
import 'package:homeequitycalculator/views/home.dart';
import 'package:homeequitycalculator/views/works.dart';
import 'package:homeequitycalculator/views/about.dart';
import 'package:homeequitycalculator/views/apply.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      routes: {
        'works': (context) => Works(),
        'about': (context) => About(),
        'apply': (context) => Apply(),
      },
    );
  }
}
