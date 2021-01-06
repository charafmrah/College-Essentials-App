import 'package:college_essentials_app/screens/inherited_widgets/NoteInheritedWidget.dart';
import 'package:flutter/material.dart';

import 'package:college_essentials_app/screens/notes_resources/Note.dart';

class NotesList extends StatefulWidget {
  @override
  _NotesList createState() {
    // TODO: implement createState
    return new _NotesList();
  }
}

class _NotesList extends State<NotesList> {
  List<Map<String, String>> get _notes => NoteInheritedWidget.of(context).notes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NotesList'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Note(NoteMode.Editing, index)));
              },
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 30, top: 30, left: 15, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _notes[index]['title'],
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      _notes[index]['text'],
                      style: TextStyle(color: Colors.grey.shade900),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )));
        },
        itemCount: _notes.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Note(NoteMode.Adding, null)));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlueAccent,
      ),
      backgroundColor: Colors.lightBlueAccent,
    );
  }
}
