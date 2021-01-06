import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class UpcomingEvents extends StatefulWidget {
  @override
  _UpcomingEvents createState() => _UpcomingEvents();
}

class _UpcomingEvents extends State<UpcomingEvents> {
  CalendarController cont;
  Map<DateTime, List<dynamic>> event;
  List<dynamic> selectEvent;
  TextEditingController eventCont;
  SharedPreferences pref;

  @override
  void initState() {
    super.initState();
    cont = CalendarController();
    eventCont = TextEditingController();
    event = {};
    selectEvent = [];
    initPrefs();
  }

  initPrefs() async {
    pref = await SharedPreferences.getInstance();
    setState(() {
      event = Map<DateTime, List<dynamic>>.from(
          decodeMap(json.decode(pref.getString("events") ?? "{}")));
    });
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF40C4FF),
        title: Text('Flutter Calendar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              events: event,
              initialCalendarFormat: CalendarFormat.week,
              calendarStyle: CalendarStyle(),
              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: (date, events, _) {
                setState(() {
                  selectEvent = events;
                });
              },
              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, events) => Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(4.4),
                    decoration: BoxDecoration(
                        color: Color(0xFF40C4FF),
                        borderRadius: BorderRadius.circular(50.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.black),
                    )),
                todayDayBuilder: (context, date, events) => Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(4.4),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.black),
                    )),
              ),
              calendarController: cont,
            ),
            ...selectEvent.map((event) => ListTile(
                  title: Text(event),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlueAccent,
        onPressed: _showAddDialog,
      ),
    );
  }

  _showAddDialog() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: eventCont,
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("Save"),
                  onPressed: () {
                    if (eventCont.text.isEmpty) return;
                    if (event[cont.selectedDay] != null) {
                      event[cont.selectedDay].add(eventCont.text);
                    } else {
                      event[cont.selectedDay] = [eventCont.text];
                    }
                    pref.setString("events", json.encode(encodeMap(event)));
                    eventCont.clear();
                    Navigator.pop(context);
                  },
                )
              ],
            ));
    setState(() {
      selectEvent = event[cont.selectedDay];
    });
  }
}
