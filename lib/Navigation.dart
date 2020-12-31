import 'package:college_essentials_app/MyHomePage.dart';
import 'package:college_essentials_app/screens/PomodoroTimer.dart';
import 'package:college_essentials_app/screens/GradesTracker.dart';
import 'package:college_essentials_app/screens/Notes.dart';
import 'package:college_essentials_app/screens/ToDoList.dart';
import 'package:college_essentials_app/screens/UpcomingEvents.dart';
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
        context, MaterialPageRoute(builder: (context) => GradesTracker()));
  }

  static Future navigateToNotes(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Notes()));
  }

  static Future navigateToToDoList(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ToDoScreen()));
  }

  static Future navigateToUpcomingEvents(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => eventspage()));
  }

  static Future navigateToTimer(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PomodoroTimer()));
  }
}
