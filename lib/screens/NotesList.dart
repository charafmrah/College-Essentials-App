import 'package:flutter/material.dart';

import 'package:college_essentials_app/screens/NotesViews/Note.dart';

class NotesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NotesList'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Note(NoteMode.Editing)));
            },
            child: Card(
                child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 30, top: 30, left: 15, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Title',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ac velit ac lacus eleifend rhoncus nec id lectus. Proin iaculis tincidunt ullamcorper. Pellentesque nunc justo, ullamcorper ut luctus eget, facilisis eu dolor. Proin tempor lectus sed neque sagittis convallis. Maecenas sit amet mollis magna, nec pretium orci. Phasellus iaculis, nisi a condimentum euismod, purus libero semper urna, sit amet consequat felis tellus vitae nulla. Duis mattis libero odio, et rutrum libero mollis at. Pellentesque egestas egestas risus. Suspendisse vel felis imperdiet, aliquet augue nec, accumsan nulla. Maecenas nec diam et elit placerat lacinia. Nulla porta dui eu ligula mollis, vel viverra dolor imperdiet. Sed lobortis, quam nec interdum vestibulum, lorem nunc rutrum massa, at blandit mi odio vitae urna. Interdum et malesuada fames ac ante ipsum primis in faucibus. ',
                    style: TextStyle(color: Colors.grey.shade900),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )));
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Note(NoteMode.Adding)));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlueAccent,
      ),
      backgroundColor: Colors.lightBlueAccent,
    );
  }
}
