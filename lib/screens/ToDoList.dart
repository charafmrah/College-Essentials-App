import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:college_essentials_app/ToDoListFile/path.dart';
import 'package:college_essentials_app/ToDoListFile/TodoListTaskList.dart';

class ToDoScreen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<ToDoScreen> {
  List _myList = [];
  final _textfieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    PathProvider.readData().then((data) {
      setState(() {
        _myList = json.decode(data);
      });
    });
  }

  void _addTask() {
    if (_textfieldController.text != "") {
      setState(() {
        Map<String, dynamic> newList = Map();
        newList["title"] = _textfieldController.text;
        newList["done"] = false;
        _myList.add(newList);
        _textfieldController.text = "";
        PathProvider.saveData(_myList);
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
                    controller: _textfieldController,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                    ),
                  ),
                ),
                RaisedButton(
                  child: Text("Add"),
                  color: Colors.greenAccent,
                  textColor: Colors.white,
                  onPressed: _addTask,
                ),
              ],
            ),
          ),
          TaskList(_myList),
        ],
      ),
    );
  }
}
