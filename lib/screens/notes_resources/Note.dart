import 'package:college_essentials_app/screens/inherited_widgets/NoteInheritedWidget.dart';
import 'package:flutter/material.dart';

import 'package:college_essentials_app/screens/notes_resources/NoteButtons.dart';

enum NoteMode { Editing, Adding }

class Note extends StatefulWidget {
  final NoteMode noteMode;
  final int index;

  Note(this.noteMode, this.index);

  @override
  _Note createState() {
    // TODO: implement createState
    return new _Note();
  }
}

class _Note extends State<Note> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _textController = TextEditingController();
  List<Map<String, String>> get _notes => NoteInheritedWidget.of(context).notes;

  @override
  void didChangeDependencies() {
    if (widget.noteMode == NoteMode.Editing) {
      _titleController.text = _notes[widget.index]['title'];
      _textController.text = _notes[widget.index]['text'];
    }

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.noteMode == NoteMode.Adding
                ? "Add A New Note"
                : "Edit Note")),
        body: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _titleController,
                decoration: InputDecoration(hintText: "Title"),
              ),
              Container(
                height: 10,
              ),
              TextField(
                controller: _textController,
                decoration: InputDecoration(hintText: "Text"),
              ),
              Container(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NoteButtons('Save', Colors.lightBlueAccent, () {
                    final title = _titleController.text;
                    final text = _textController.text;
                    if (widget?.noteMode == NoteMode.Adding) {
                      _notes.add({'title': title, 'text': text});
                    } else if (widget?.noteMode == NoteMode.Editing) {
                      _notes[widget.index] = {'title': title, 'text': text};
                    }
                    Navigator.pop(context);
                  }),
                  widget.noteMode == NoteMode.Editing
                      ? NoteButtons('Delete', Colors.red, () {
                          _notes.removeAt(widget.index);
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
