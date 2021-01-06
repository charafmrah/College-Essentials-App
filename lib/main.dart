import 'package:college_essentials_app/screens/inherited_widgets/NoteInheritedWidget.dart';
import 'package:flutter/material.dart';

import 'package:college_essentials_app/MyHomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return NoteInheritedWidget(
      MaterialApp(
        title: "College Essentials",
        home: MyHomePage(),
      ),
    );
  }
}
