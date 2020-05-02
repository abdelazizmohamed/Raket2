import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter123/TaskDetailsScreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'AddNewTaskScreen.dart';
import 'firestoreservice.dart';
import 'taskModel.dart';

class MyHomeTasks extends StatefulWidget {
  MyHomeTasks({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

delete(String id) {
  FirestoreService fire = new FirestoreService();
  fire.getTaskList().listen((QuerySnapshot snapshot) {
    Firestore.instance.collection('todolist').document(id).delete();
  });
}

class _MyHomePageState extends State<MyHomeTasks> {
  List<Task> items;
  FirestoreService fireService = new FirestoreService();
  StreamSubscription<QuerySnapshot> todoTasks;

//  Firestore firestore = Firestore.instance;

  @override
  void initState() {
    super.initState();

    items = new List();
    todoTasks?.cancel();

    todoTasks = fireService.getTaskList().listen((QuerySnapshot snapshot) {
      List<Task> tasks = snapshot.documents
          .map((documentSnapshot) => Task.fromMap(documentSnapshot.data))
          .toList();

      setState(() {
        return this.items = tasks;
      });
    });
  }

  onTapped(Task post) {
    // navigate to the next screen.
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TaskDetailsScreen(post)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x99bceaf9),
      resizeToAvoidBottomInset: false,
      body: Column(
//        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[
          _myAppBar(context),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 140,
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  var post = items[index];
                  return new ListTile(
                    title: new Card(
                      child: Stack(children: <Widget>[
                        Column(children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 15.0, right: 15.0),
                            child: Container(
//                              width: MediaQuery.of(context).size.width,
                              height: 80.0,
                              child: Material(
                                color: Colors.white,
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        todoType('${items[index].tasktype}'),
                                        Text(
                                          '${items[index].taskname}',
                                          style: TextStyle(
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 21.0),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              '${items[index].taskdate}',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              '${items[index].tasktime}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 16.0),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ]),
                    ),
                    onTap: () => onTapped(post),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0x9935c1e3),
        child: Icon(
          FontAwesomeIcons.tasks,
          color: Colors.white,
        ),
        tooltip: 'Increment',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TaskScreen(Task('', '', '', '', '')),
                fullscreenDialog: true),
          );
        },
      ),
    );
  }

  Widget todoType(String icontype) {
    IconData iconval;
    Color colorval;
    switch (icontype) {
      default:
        iconval = FontAwesomeIcons.tasks;
//        Color(0xff4caf50)
        colorval = Color(0x9935c1e3);
      //
    }
    return CircleAvatar(
      backgroundColor: colorval,
      child: Icon(iconval, color: Colors.white, size: 20.0),
    );
  }

  Widget _myAppBar(context) {
    return Center(
      child: Container(
        color: Color(0x99d6f0f9),
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Center(
              child: Container(
                child: Text(
                  'Home',
                  style: TextStyle(
                      color: Color(0xEEE2566E),
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0),
                ),
              ),
            )),
      ),
    );
  }
}
