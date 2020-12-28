import 'package:flutter/material.dart';

import 'package:college_essentials_app/Navigation.dart';

class MyHomePage extends StatelessWidget {
  final String title = "College Essentials";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            RaisedButton.icon(
              icon: Icon(
                Icons.calculate_outlined,
              ),
              label: new Text(
                "GPA Calculator",
              ),
              color: Colors.lightBlueAccent,
              textColor: Colors.white,
              onPressed: () => Navigation.navigateToGpaCalculator(context),
            ),
            RaisedButton.icon(
              icon: Icon(
                Icons.add_circle_outline,
              ),
              label: new Text("TO-DO List"),
              color: Colors.lightBlueAccent,
              textColor: Colors.white,
              onPressed: () => Navigation.navigateToToDoList(context),
            ),
            RaisedButton.icon(
              icon: Icon(
                Icons.assignment,
              ),
              label: new Text("Notes"),
              color: Colors.lightBlueAccent,
              textColor: Colors.white,
              onPressed: () => Navigation.navigateToNotes(context),
            ),
            RaisedButton.icon(
              icon: Icon(
                Icons.calendar_today_rounded,
              ),
              label: new Text("Upcoming Events"),
              color: Colors.lightBlueAccent,
              textColor: Colors.white,
              onPressed: () => Navigation.navigateToUpcomingEvents(context),
            ),
            RaisedButton.icon(
              icon: Icon(
                Icons.description_outlined,
              ),
              label: new Text("Grades Tracker"),
              color: Colors.lightBlueAccent,
              textColor: Colors.white,
              onPressed: () => Navigation.navigateToGradesTracker(context),
            ),
            RaisedButton.icon(
              icon: Icon(
                Icons.timer,
              ),
              label: new Text("Timer"),
              color: Colors.lightBlueAccent,
              textColor: Colors.white,
              onPressed: () => Navigation.navigateToTimer(context),
            ),
          ],
        ),
      ),
    );
  }
}
