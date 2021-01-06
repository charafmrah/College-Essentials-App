import 'dart:async';
import 'package:college_essentials_app/Navigation.dart';

import 'package:flutter/material.dart';

class PomodoroTimer extends StatefulWidget {
  @override
  _PomodoroTimerState createState() => _PomodoroTimerState();
}

class _PomodoroTimerState extends State<PomodoroTimer> {
  int _counter = 25;
  Timer _timer;
  String startTimer = "Start 25 minutes count down";
  bool isEnabled = true;
  bool _canShowButton = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pomodoro Timer"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.info,
              color: Colors.white,
            ),
            onPressed: () => Navigation.navigateToPomodoroTimerInfo(context),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            (_counter > 0)
                ? Text(
                    "! If the timer starts, you can't pause !",
                    style: TextStyle(color: Colors.red.shade700, fontSize: 16),
                  )
                : Text(
                    "DONE!",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 58,
                    ),
                  ),
            Container(
              padding: EdgeInsets.all(20),
            ),
            Text(
              '$_counter',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 60,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: !_canShowButton
                  ? const SizedBox.shrink()
                  : MaterialButton(
                      padding: EdgeInsets.all(30),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.lightBlueAccent)),
                      onPressed: () {
                        if (_timer != null) {
                          _timer.cancel();
                        }

                        _timer = Timer.periodic(
                            Duration(minutes: 1, seconds: 1), (timer) {
                          setState(() {
                            if (_counter > 0) {
                              _counter--;
                            } else {
                              _timer.cancel();
                            }
                          });
                        });
                      },
                      child: Text(startTimer,
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      color: Colors.lightBlueAccent,
                    ),
            )
          ],
        ),
      ),
    );
  }

  void hideWidget() {
    setState(() {
      _canShowButton = !_canShowButton;
    });
  }

  enableButton() {
    setState(() {
      isEnabled = true;
    });
  }

  disableButton() {
    setState(() {
      isEnabled = false;
    });
  }
}
