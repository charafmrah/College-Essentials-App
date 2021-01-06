import 'package:flutter/material.dart';
import 'package:college_essentials_app/todo_list_resources/path.dart';

class ToDoTaskList extends StatefulWidget {
  List todoList;

  ToDoTaskList(this.todoList);

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<ToDoTaskList> {
  Map<String, dynamic> _lastRemoved;
  int _lastPosRemoved;

  @override
  Widget build(BuildContext context) {
    var _myList = widget.todoList;

    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1));
          setState(() {
            _myList.sort((a, b) {
              if (a["done"] && !b["done"])
                return 1;
              else if (!a["done"] && b["done"])
                return -1;
              else
                return 0;
            });
            Path.saveData(_myList);
          });
        },
        child: ListView.builder(
          itemCount: _myList.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.red,
                child: Align(
                  alignment: Alignment(-0.9, 0.0),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
              direction: DismissDirection.startToEnd,
              child: CheckboxListTile(
                title: Text(_myList[index]["title"]),
                value: _myList[index]["done"],
                activeColor: Colors.lightBlueAccent,
                secondary: CircleAvatar(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.lightBlueAccent,
                  child:
                      Icon(_myList[index]["done"] ? Icons.check : Icons.close),
                ),
                onChanged: (c) {
                  setState(() {
                    _myList[index]["done"] = c;
                    Path.saveData(_myList);
                  });
                },
              ),
              onDismissed: (direction) {
                setState(() {
                  _lastRemoved = Map.from(widget.todoList[index]);
                  _lastPosRemoved = index;
                  widget.todoList.removeAt(index);

                  Path.saveData(_myList);
                  final snack = SnackBar(
                    content: Text("Task ${_lastRemoved["title"]} removed!"),
                    action: SnackBarAction(
                      label: "Undo",
                      onPressed: () {
                        setState(() {
                          widget.todoList.insert(_lastPosRemoved, _lastRemoved);
                          Path.saveData(_myList);
                        });
                      },
                    ),
                    duration: Duration(seconds: 3),
                  );
                  Scaffold.of(context).removeCurrentSnackBar();
                  Scaffold.of(context).showSnackBar(snack);
                });
              },
            );
          },
        ),
      ),
    );
  }
}
