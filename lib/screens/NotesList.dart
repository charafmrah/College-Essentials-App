import 'package:college_essentials_app/screens/inherited_widgets/NoteInheritedWidget.dart';
import 'package:college_essentials_app/screens/notes_resources/Note.dart';
import 'package:college_essentials_app/providers/NoteProvider.dart';

import 'package:flutter/material.dart';

class NotesList extends StatefulWidget {
  @override
  _NotesList createState() {
    return new _NotesList();
  }
}

class _NotesList extends State<NotesList> {
  List<Map<String, String>> get notes => NoteInheritedWidget.of(context).notes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NotesList'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: FutureBuilder(
          future: NoteProvider.getNoteList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final notes = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Note(NoteMode.Editing, notes[index])));
                      },
                      child: Card(
                          child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 30, top: 30, left: 15, right: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              notes[index]['title'],
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              notes[index]['text'],
                              style: TextStyle(color: Colors.grey.shade900),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      )));
                },
                itemCount: notes.length,
              );
            }
            //if we didn't retrieve the data yet then display this widget:
            return Center(child: CircularProgressIndicator());
          }),
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
