import 'package:flutter/material.dart';

class PomodoroTimerInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("What's Pomodoro Technique?"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Image.asset(
                'college_essentials_app/assets/images/pomodoro.jpg',
                scale: 0.8,
              ),
            ],
          ),
        ), //   <-- image
      ),
    );
  }
}
