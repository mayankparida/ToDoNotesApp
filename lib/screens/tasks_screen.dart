import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  String taskname;

  Color pink = Color(0xFFEB1555);

  Color dullnblue = Color(0xFF1D1E33);

  Color nblue = Color(0xFF0A0E21);

  Color grey = Color(0xFF8D8E98);

  List<String> Tasks = ["Welcome to Tasks!", "Long press to delete a task"];

  List<String> checkbox = ["0", "0"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Text(
                      "Notes",
                      style: TextStyle(
                          color: grey,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "Tasks",
                      style: TextStyle(
                          color: pink,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Divider(
                thickness: 1.0,
                color: pink,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: Tasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        onLongPress: () async {
                          setState(() {
                            Tasks.removeAt(index);
                            checkbox.removeAt(index);
                          });
                        },
                        leading: Checkbox(
                          value: checkbox[index] == "0" ? false : true,
                          activeColor: Color(0xFFEB1555),
                          onChanged: (value) {
                            setState(() async {
                              if (checkbox[index] == "0") {
                                checkbox[index] = "1";
                              } else {
                                checkbox[index] = "0";
                              }
                            });
                          },
                        ),
                        title: Text(
                          Tasks[index],
                          style: TextStyle(
                              decoration:
                                  (checkbox[index] == "0" ? false : true)
                                      ? TextDecoration.lineThrough
                                      : null,
                              fontWeight: FontWeight.bold,
                              color: (checkbox[index] == "0" ? false : true)
                                  ? Color(0xFF8D8E98)
                                  : Colors.white),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xFF1D1E33),
                        borderRadius: BorderRadius.circular(10.0)),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                color: Color(0xff060610),
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFEB1555),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Center(
                        child: Text(
                          "Add Task",
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1D1E33)),
                        ),
                      ),
                      TextField(
                        onChanged: (value) {
                          taskname = value;
                        },
                        style: TextStyle(
                            color: Color(0xFF1D1E33),
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          hintText: "Enter Task",
                          hintStyle: TextStyle(fontWeight: FontWeight.bold),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF1D1E33), width: 3.0),
                          ),
                        ),
                        cursorColor: Color(0xFF1D1E33),
                        autofocus: true,
                        textAlign: TextAlign.center,
                      ),
                      RaisedButton(
                        onPressed: () async {
                          setState(() {
                            Tasks.add(taskname);
                            checkbox.add("0");
                          });
                          Navigator.pop(context);
                        },
                        color: Color(0xFF1D1E33),
                        child: Text(
                          "Add",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          backgroundColor: pink,
          child: Icon(
            Icons.add,
            size: 40.0,
          ),
        ),
      ),
    );
  }
}
