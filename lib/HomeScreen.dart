import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firestoreservice.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'AddNewTaskScreen.dart';
import 'taskModel.dart';

class MyHomeTasks extends StatefulWidget {
  MyHomeTasks({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//class ListItem<T> {
//  bool isSelected = false; //Selection property to highlight or not
//  T data; //Data of the user
//  ListItem(this.data); //Constructor to assign the data
//  void populateData() {
//    list = [];
//    for (int i = 0; i < 10; i++)
//      list.add(ListItem<String>("item $i"));
//  }
//  Widget _getListItemTile(BuildContext context, int index) {
//    return Container(
//      margin: EdgeInsets.symmetric(vertical: 4),
//      color: list[index].isSelected ? Colors.red[100] : Colors.white,
//      child: ListTile(
//        title: Text(list[index].data),
//      ),
//    );
//  }
//}

class _MyHomePageState extends State<MyHomeTasks> {
  List<Task> items;
  FirestoreService fireService = new FirestoreService();
  StreamSubscription<QuerySnapshot> todoTasks;
//
//  void populateData() {
//    list = [];
//    for (int i = 0; i < 10; i++) list.add(ListItem<String>("item $i"));
//  }

  @override
  void initState() {
    super.initState();

    items = new List();
    todoTasks?.cancel();
    todoTasks = fireService.getTaskList().listen((QuerySnapshot snapshot) {
      final List<Task> tasks = snapshot.documents
          .map((documentSnapshot) => Task.fromMap(documentSnapshot.data))
          .toList();
      setState(() {
//        if (tasks == null) return true;
        return this.items = tasks;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      resizeToAvoidBottomInset: false,
      body: Column(
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[
          _myAppBar(context),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 140,
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Stack(children: <Widget>[
                    Column(children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 25.0, right: 25.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 120.0,
                          child: Padding(
                            padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                            child: Material(
                              color: Colors.white,
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      todoType('${items[index].tasktype}'),
                                      Text(
                                        '${items[index].taskname}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.0),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            '${items[index].taskdate}',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '${items[index].tasktime}',
                                            style: TextStyle(
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
                      ),
                    ]),
                  ]);
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff4caf50),
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
        colorval = Color(0xff4caf50);
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
        color: Colors.green[50],
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Center(
              child: Container(
                child: Text(
                  'Home',
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0),
                ),
              ),
            )),
      ),
    );
  }
}
