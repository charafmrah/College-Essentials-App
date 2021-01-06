import 'package:flutter/material.dart';

import 'package:college_essentials_app/screens/NotesViews/NoteButtons.dart';

enum NoteMode { Editing, Adding }

class Note extends StatelessWidget {
  final NoteMode _noteMode;

  Note(this._noteMode);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
                _noteMode == NoteMode.Adding ? "Add A New Note" : "Edit Note")),
        body: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: "Title"),
              ),
              Container(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Text"),
              ),
              Container(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NoteButtons('Save', Colors.lightBlueAccent, () {
                    Navigator.pop(context);
                  }),
                  _noteMode == NoteMode.Editing
                      ? NoteButtons('Delete', Colors.red, () {
                          Navigator.pop(context);
                        })
                      : Container(),
                ],
              )
            ],
          ),
        ));
  }
}
