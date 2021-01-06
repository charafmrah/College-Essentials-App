import 'package:flutter/material.dart';

class NoteInheritedWidget extends InheritedWidget {
  NoteInheritedWidget(Widget child) : super(child: child);

  final notes = [
    {
      'title': "Hi",
      'text':
          'This is just an example. Edit this note or delete it if you want to.'
    },
  ];

  static NoteInheritedWidget of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(NoteInheritedWidget)
        as NoteInheritedWidget);
  }

  @override
  bool updateShouldNotify(NoteInheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget != notes;
  }
}
