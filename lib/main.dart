import 'package:flutter/material.dart';

import 'package:college_essentials_app/MyHomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "College Essentials",
      home: MyHomePage(),
    );
  }
}
