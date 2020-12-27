import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final String title = "College Essentials";

  // MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Wrap(
        children: <Widget>[
          RaisedButton(
            child: new Text("GPA Calculator"),
            color: Colors.blueAccent[600],
            onPressed: null,
          ),
          RaisedButton(
            child: new Text("TO-DO List"),
            onPressed: null,
          ),
          RaisedButton(
            child: new Text("Notes"),
            onPressed: null,
          ),
          RaisedButton(
            child: new Text("Upcoming Events"),
            onPressed: null,
          ),
          RaisedButton(
            child: new Text("Grades Tracker"),
            onPressed: null,
          ),
        ],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            // DrawerHeader(
            //   child: Text('Options'),
            //   decoration: BoxDecoration(
            //     color: Colors.blue,
            //   ),
            // ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
