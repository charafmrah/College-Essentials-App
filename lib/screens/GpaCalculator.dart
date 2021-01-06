import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:college_essentials_app/Navigation.dart';

class GpaCalculator extends StatefulWidget {
  GpaCalculator({Key key}) : super(key: key);

  @override
  _GpaCalculator createState() => _GpaCalculator();
}

class _GpaCalculator extends State<GpaCalculator> {
  List<String> creditList = ["0", "1", "2", "3", "4", "5"];
  List<String> scoreList = [
    "A",
    "A-",
    "B+",
    "B",
    "B-",
    "C+",
    "C",
    "C-",
    "D+",
    "D",
    "D-",
    "F",
    "NA"
  ];
  String credit1, credit2, credit3, credit4, credit5;
  String grade1, grade2, grade3, grade4, grade5;
  double score1, score2, score3, score4, score5;

  double calculcateGpa(
      String credit1,
      String credit2,
      String credit3,
      String credit4,
      String credit5,
      String grade1,
      String grade2,
      String grade3,
      String grade4,
      String grade5) {
    return ((int.parse(credit1) * score1) +
            (int.parse(credit2) * score2) +
            (int.parse(credit3) * score3) +
            (int.parse(credit4) * score4) +
            (int.parse(credit5) * score5)) /
        (int.parse(credit1) +
            int.parse(credit2) +
            int.parse(credit3) +
            int.parse(credit4) +
            int.parse(credit5));
  }

  double convertGradeToScore(String score) {
    if (score == "A") {
      return 4.0;
    } else if (score == "A-") {
      return 3.67;
    } else if (score == "B+") {
      return 3.33;
    } else if (score == "B") {
      return 3.0;
    } else if (score == "B-") {
      return 2.67;
    } else if (score == "C+") {
      return 2.33;
    } else if (score == "C") {
      return 2.0;
    } else if (score == "C-") {
      return 1.67;
    } else if (score == "D+") {
      return 1.33;
    } else if (score == "D") {
      return 1.0;
    } else if (score == "D-") {
      return 0.67;
    } else if (score == "NA") {
      return 0;
    } else {
      return 0;
    }
  }

  String credit1DropDownValue = "1";
  String credit2DropDownValue = "1";
  String credit3DropDownValue = "1";
  String credit4DropDownValue = "1";
  String credit5DropDownValue = "1";
  String grade1DropdownValue = "NA";
  String grade2DropdownValue = "NA";
  String grade3DropdownValue = "NA";
  String grade4DropdownValue = "NA";
  String grade5DropdownValue = "NA";

  @override
  Widget build(BuildContext context) {
    credit1 = credit1DropDownValue;
    credit2 = credit2DropDownValue;
    credit3 = credit3DropDownValue;
    credit4 = credit4DropDownValue;
    credit5 = credit5DropDownValue;
    grade1 = grade1DropdownValue;
    grade2 = grade2DropdownValue;
    grade3 = grade3DropdownValue;
    grade4 = grade4DropdownValue;
    grade5 = grade5DropdownValue;
    score1 = convertGradeToScore(grade1);
    score2 = convertGradeToScore(grade2);
    score3 = convertGradeToScore(grade3);
    score4 = convertGradeToScore(grade4);
    score5 = convertGradeToScore(grade5);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GPA Calculator',
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
        alignment: Alignment.center,
        child: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: (1.5),
            children: <Widget>[
              //First Row
              Text(
                "",
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                "Credit",
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                "Score",
                style: Theme.of(context).textTheme.headline5,
              ),

              //Second Row
              Text(
                "Course 1:",
                style: Theme.of(context).textTheme.headline5,
              ),
              DropdownButton<String>(
                value: credit1DropDownValue,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 5,
                style: TextStyle(color: Colors.blue),
                underline: Container(
                  height: 2,
                  color: Colors.lightBlueAccent,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    credit1DropDownValue = newValue;
                    credit1 = newValue;
                  });
                },
                items: creditList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              DropdownButton<String>(
                value: grade1DropdownValue,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.blue),
                underline: Container(
                  height: 2,
                  color: Colors.lightBlueAccent,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    grade1DropdownValue = newValue;
                    grade1 = newValue;
                  });
                },
                items: scoreList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),

              //Second Row
              Text(
                "Course 2:",
                style: Theme.of(context).textTheme.headline5,
              ),
              DropdownButton<String>(
                value: credit2DropDownValue,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.blue),
                underline: Container(
                  height: 2,
                  color: Colors.lightBlueAccent,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    credit2DropDownValue = newValue;
                    credit2 = newValue;
                  });
                },
                items: creditList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              DropdownButton<String>(
                value: grade2DropdownValue,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.blue),
                underline: Container(
                  height: 2,
                  color: Colors.lightBlueAccent,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    grade2DropdownValue = newValue;
                    grade2 = newValue;
                  });
                },
                items: scoreList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),

              //Third Row
              Text(
                "Course 3:",
                style: Theme.of(context).textTheme.headline5,
              ),
              DropdownButton<String>(
                value: credit3DropDownValue,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.blue),
                underline: Container(
                  height: 2,
                  color: Colors.lightBlueAccent,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    credit3DropDownValue = newValue;
                    credit3 = newValue;
                  });
                },
                items: creditList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              DropdownButton<String>(
                value: grade3DropdownValue,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.blue),
                underline: Container(
                  height: 2,
                  color: Colors.lightBlueAccent,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    grade3DropdownValue = newValue;
                    grade3 = newValue;
                  });
                },
                items: scoreList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),

              //Fourth Row
              Text(
                "Course 4:",
                style: Theme.of(context).textTheme.headline5,
              ),
              DropdownButton<String>(
                value: credit4DropDownValue,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.blue),
                underline: Container(
                  height: 2,
                  color: Colors.lightBlueAccent,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    credit4DropDownValue = newValue;
                    credit4 = newValue;
                  });
                },
                items: creditList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              DropdownButton<String>(
                value: grade4DropdownValue,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.blue),
                underline: Container(
                  height: 2,
                  color: Colors.lightBlueAccent,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    grade4DropdownValue = newValue;
                    grade4 = newValue;
                  });
                },
                items: scoreList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),

              //Fifth Row
              Text(
                "Course 5:",
                style: Theme.of(context).textTheme.headline5,
              ),
              DropdownButton<String>(
                value: credit5DropDownValue,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.blue),
                underline: Container(
                  height: 2,
                  color: Colors.lightBlueAccent,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    credit5DropDownValue = newValue;
                    credit5 = newValue;
                  });
                },
                items: creditList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              DropdownButton<String>(
                value: grade5DropdownValue,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.blue),
                underline: Container(
                  height: 2,
                  color: Colors.lightBlueAccent,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    grade5DropdownValue = newValue;
                    grade5 = newValue;
                  });
                },
                items: scoreList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),

              //Sixth row
              Text(
                "",
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                "GPA =",
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                calculcateGpa(credit1, credit2, credit3, credit4, credit5,
                        grade1, grade2, grade3, grade4, grade5)
                    .toStringAsFixed(2),
                style: Theme.of(context).textTheme.headline5,
              ),
            ]),
      ),

      // // menu bar:
      // drawer: Drawer(
      //   // Add a ListView to the drawer. This ensures the user can scroll
      //   // through the options in the drawer if there isn't enough vertical
      //   // space to fit everything.
      //   child: ListView(
      //     // Important: Remove any padding from the ListView.
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       // DrawerHeader(
      //       //   child: Text('Options'),
      //       //   decoration: BoxDecoration(
      //       //     color: Colors.blue,
      //       //   ),
      //       // ),
      //       ListTile(
      //         title: Text('Home Page'),
      //         onTap: () {
      //           Navigator.pop(context);
      //           Navigation.navigateToMyHomePage(context);
      //         },
      //       ),
      //       ListTile(
      //         title: Text('To-Do List'),
      //         onTap: () {
      //           // Update the state of the app
      //           // ...
      //           // Then close the drawer
      //           Navigator.pop(context);
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
