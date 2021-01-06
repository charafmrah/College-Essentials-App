import 'package:college_essentials_app/MyHomePage.dart';
import 'package:college_essentials_app/screens/PomodoroTimer.dart';
import 'package:college_essentials_app/screens/BasicCalculator.dart';
import 'package:college_essentials_app/screens/NotesList.dart';
import 'package:college_essentials_app/screens/ToDoList.dart';
import 'package:college_essentials_app/screens/UpcomingEvents.dart';
import 'package:college_essentials_app/screens/timer_resources/PomodoroTimerInfo.dart';
import 'package:flutter/material.dart';

import 'package:college_essentials_app/screens/GpaCalculator.dart';

//This class handles navigation methods

class Navigation {
  static Future navigateToMyHomePage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  static Future navigateToGpaCalculator(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => GpaCalculator()));
  }

  static Future navigateToGradesTracker(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => basicCalc()));
  }

  static Future navigateToNotes(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NotesList()));
  }

  static Future navigateToToDoList(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ToDoListScreen()));
  }

  static Future navigateToUpcomingEvents(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => UpcomingEvents()));
  }

  static Future navigateToTimer(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PomodoroTimer()));
  }

  static Future navigateToPomodoroTimerInfo(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PomodoroTimerInfo()));
  }
}
