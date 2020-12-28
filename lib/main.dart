import 'package:flutter/material.dart';

import 'package:college_essentials_app/MyHomePage.dart';
import 'package:college_essentials_app/screens/GpaCalculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Test",
      home: MyHomePage(),
    );
  }
}
