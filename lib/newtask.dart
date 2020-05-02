//new taskModel.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewTask extends StatefulWidget {
  NewTask();

  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  String taskname, taskdetails, taskDate, taskTime, taskType;

  getTaskName(taskname) {
    this.taskname = taskname;
  }

  getTaskDetails(taskdetails) {
    this.taskdetails = taskdetails;
  }

  getTaskDate(taskDate) {
    this.taskDate = taskDate;
  }

  getTaskTime(taskTime) {
    this.taskTime = taskname;
  }

  getTaskType(taskType) {
    this.taskType = taskType;
  }

  createData() {
    DocumentReference ds =
        Firestore.instance.collection('todolist').document(taskname);
    Map<String, dynamic> tasks = {
      "taskname": taskname,
      "taskdetails": taskdetails,
      "taskdate": taskDate,
      "tasktype": ds.documentID.toString(),
      "tasktime": taskTime,
    };

    ds.setData(tasks).whenComplete(() {
      print(ds.documentID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 80,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: TextField(
                    // controller: _taskNameController,
                    onChanged: (String name) {
                      getTaskName(name);
                    },
                    decoration: InputDecoration(labelText: "Task: "),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: TextField(
                    //controller: _taskDetailsController,
                    decoration: InputDecoration(labelText: "Details: "),
                    onChanged: (String taskdetails) {
                      getTaskDetails(taskdetails);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: TextField(
                    // controller: _taskDateController,
                    decoration: InputDecoration(labelText: "Date: "),
                    onChanged: (String taskdate) {
                      getTaskDate(taskdate);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: TextField(
                    // controller: _taskTimeController,
                    decoration: InputDecoration(labelText: "Time: "),
                    onChanged: (String tasktime) {
                      getTaskTime(tasktime);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: TextField(
                    // controller: _taskTimeController,
                    decoration: InputDecoration(labelText: "Time: "),
                    onChanged: (String tasktype) {
                      getTaskTime(tasktype);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                        color: Color(0xFFFA7397),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(color: Color(0xFFFDDE42)),
                        )),
                    // This button results in adding the contact to the database
                    RaisedButton(
                        color: Color(0xAAEA3392),
                        onPressed: () {
                          createData();
                        },
                        child: const Text(
                          "Submit",
                          style: TextStyle(color: Color(0xFFFDDE42)),
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
