import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'firestoreservice.dart';
import 'taskModel.dart';

class TaskDetailsScreen extends StatelessWidget {
  Task _task;
  String details, title, city, date;

  TaskDetailsScreen(task) {
    _task = task;
    details = _task.taskdetails;
    date = _task.taskdate;
    title = _task.taskname;
    city = _task.tasktime;
  }

  delete(String id) {
    FirestoreService fire = new FirestoreService();
    fire.getTaskList().listen((QuerySnapshot snapshot) {
      Firestore.instance.collection('todolist').document(id).delete();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
//      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
//          _myAppBar(),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: <Widget>[
                RaisedButton(
                    color: Colors.lightBlue[50],
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    padding: EdgeInsets.only(
                        left: 0, right: 500.0, top: 0.0, bottom: 10.0),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(100.0)),
//                    splashColor: Colors.white,
                    child: const Text(
                      '◀',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0x9935c1e3)),
                    )),
                Padding(
                  padding: EdgeInsets.only(
                      left: 140.0, right: 140.0, top: 20.0, bottom: 10.0),
                  child: Text(
                    '$title',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Color(0xEEE2566E),
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 16.0, bottom: 10.0),
                  child: Text(
                    '$date   ' '  $city',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 30.0, bottom: 10.0),
                  child: Text(
                    'Details:',
                    textAlign: TextAlign.left,
//                    overflow: TextOverflow.visible,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.blue),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 10.0, bottom: 30.0),
                  child: Text(
                    '$details',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.black54),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                        color: Color(0x9935c1e3),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(27.0)),
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        splashColor: Colors.white,
                        child: const Text(
                          "Back",
                          style: TextStyle(fontSize: 22.0, color: Colors.white),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(100.0),
                      child: RaisedButton(
                          color: Color(0xEEE2566E),
                          onPressed: () {
                            delete(title);
                            Navigator.of(context).pop();
                          },
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(27.0)),
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          splashColor: Colors.white,
                          child: const Text(
                            "DELETE",
                            style:
                                TextStyle(fontSize: 22.0, color: Colors.white),
                          )),
                    ),
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
