import 'package:flutter/material.dart';

class basicCalc extends StatefulWidget {
  @override
  BasicCalcPage createState() => BasicCalcPage();
}

class BasicCalcPage extends State<basicCalc> {
  var first;
  var second;
  var textchange = "";
  var result;
  var optop;

  void btnclicked(var textbutton) {
    if (textbutton == "C") {
      textchange = "";
      first = 0;
      second = 0;
      result = "";
    } else if (textbutton == "+" ||
        textbutton == "-" ||
        textbutton == "x" ||
        textbutton == "/") {
      first = int.parse(textchange);
      result = "";
      optop = textbutton;
    } else if (textbutton == "=") {
      second = int.parse(textchange);
      if (optop == "+") {
        result = (first + second).toString();
      }
      if (optop == "-") {
        result = (first - second).toString();
      }
      if (optop == "x") {
        result = (first * second).toString();
      }
      if (optop == "/") {
        result = (first ~/ second).toString();
      }
    } else {
      result = int.parse(textchange + textbutton).toString();
    }

    setState(() {
      textchange = result;
    });
  }

  Widget button(var buttonvalue) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(30.0),
        onPressed: () => btnclicked(buttonvalue),
        child: Text(
          "$buttonvalue",
          style: TextStyle(
            fontSize: 30.5,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Basic Calculator",
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.5),
                alignment: Alignment.bottomLeft,
                child: Text(
                  "$textchange",
                  style: TextStyle(
                    fontSize: 30.5,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                button("9"),
                button("8"),
                button("7"),
                button("+"),
              ],
            ),
            Row(
              children: <Widget>[
                button("6"),
                button("5"),
                button("4"),
                button("-"),
              ],
            ),
            Row(
              children: <Widget>[
                button("3"),
                button("2"),
                button("1"),
                button("x"),
              ],
            ),
            Row(
              children: <Widget>[
                button("C"),
                button("0"),
                button("="),
                button("/"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
