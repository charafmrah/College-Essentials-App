import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:college_essentials_app/ToDoListFile/path.dart';
import 'package:college_essentials_app/ToDoListFile/TodoListTaskList.dart';

class ToDoListScreen extends StatefulWidget {
  @override
  ToDoListCondition createState() => ToDoListCondition();
}

class ToDoListCondition extends State<ToDoListScreen> {
  List tdList = [];
  final textcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Path.readData().then((data) {
      setState(() {
        tdList = json.decode(data);
      });
    });
  }

  void taskadd() {
    if (textcontroller.text != "") {
      setState(() {
        Map<String, dynamic> newList = Map();
        newList["title"] = textcontroller.text;
        newList["done"] = false;
        tdList.add(newList);
        textcontroller.text = "";
        Path.saveData(tdList);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do List"),
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: textcontroller,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.lightBlueAccent)),
                    ),
                  ),
                ),
                RaisedButton(
                  child: Text("Add"),
                  color: Colors.lightBlueAccent,
                  textColor: Colors.white,
                  onPressed: taskadd,
                ),
              ],
            ),
          ),
          ToDoTaskList(tdList),
        ],
      ),
    );
  }
}
