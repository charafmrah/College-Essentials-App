import 'package:flutter/material.dart';

class Notes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: <Widget>[
              Text('Title'),
              Text('Text'),
            ],
          ),
        );
      }),
    );
  }
}
