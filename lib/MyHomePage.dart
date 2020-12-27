import 'package:flutter/material.dart';

import 'package:college_essentials_app/Navigation.dart';

class MyHomePage extends StatelessWidget {
  final String title = "College Essentials";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        width: double.infinity,
        alignment: Alignment.topCenter,
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 8.0,
          runSpacing: 4.0,
          children: <Widget>[
            RaisedButton(
              child: new Text("GPA Calculator"),
              color: Colors.redAccent,
              textColor: Colors.white,
              onPressed: () => Navigation.navigateToGpaCalculator(context),
            ),
            RaisedButton(
              child: new Text("TO-DO List"),
              color: Colors.redAccent,
              textColor: Colors.white,
              onPressed: () => Navigation.navigateToToDoList(context),
            ),
            RaisedButton(
              child: new Text("Notes"),
              color: Colors.redAccent,
              textColor: Colors.white,
              onPressed: () => Navigation.navigateToNotes(context),
            ),
            RaisedButton(
              child: new Text("Upcoming Events"),
              color: Colors.redAccent,
              textColor: Colors.white,
              onPressed: () => Navigation.navigateToUpcomingEvents(context),
            ),
            RaisedButton(
              child: new Text("Grades Tracker"),
              color: Colors.redAccent,
              textColor: Colors.white,
              onPressed: () => Navigation.navigateToGradesTracker(context),
            ),
          ],
        ),
      ),
    );
  }
}
