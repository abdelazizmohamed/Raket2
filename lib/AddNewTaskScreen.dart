import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'firestoreservice.dart';
import 'taskModel.dart';

class TaskScreen extends StatefulWidget {
  final Task task;

  TaskScreen(this.task);

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  FirestoreService fireService = new FirestoreService();

  TextEditingController _taskNameController;
  TextEditingController _taskDetailsController;
  TextEditingController _taskDateController;
  TextEditingController _taskTimeController;
  TextEditingController _myTaskTyp;

  @override
  void initState() {
    super.initState();

    _taskNameController = new TextEditingController(text: widget.task.taskname);
    _taskDetailsController =
        new TextEditingController(text: widget.task.taskdetails);
    _taskDateController = new TextEditingController(text: widget.task.taskdate);
    _taskTimeController = new TextEditingController(text: widget.task.tasktime);
    _myTaskTyp = new TextEditingController(text: widget.task.tasktype);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.lightBlue[50],
//      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          _myAppBar(),
          Container(

            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height - 100,
            child: ListView(
              children: <Widget>[
                Padding(

                  padding: EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 16.0, bottom: 10.0),
                  child: TextField(

                    style: TextStyle(fontSize: 22.0, color: Colors.black45),
                    autocorrect: true,
                    controller: _taskNameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Name',
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 20.0, top: 20.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black45),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 16.0, bottom: 10.0),
                  child: TextField(
                    style: TextStyle(fontSize: 22.0, color: Colors.black45),
                    autocorrect: true,
                    controller: _taskDateController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Date',
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 20.0, top: 20.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black45),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 16.0, bottom: 40.0),
                  child: TextField(
                    style: TextStyle(fontSize: 22.0, color: Colors.black45),
                    autocorrect: true,
                    controller: _taskTimeController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Location',
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 20.0, top: 20.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black45),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                    ),
                  ),
                ),
                Container(
//                  width: MediaQuery.of(context).size.width,
//                  height: MediaQuery.of(context).size.height - 100,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 30.0, right: 30.0, top: 16.0, bottom: 90.0),
                    child: TextField(
                      maxLines: 15,
                      style: TextStyle(fontSize: 22.0, color: Colors.black45),
                      autocorrect: true,
                      controller: _taskDetailsController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Details',
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 20.0, top: 20.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black45),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                        color: Color(0xEEE2566E),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(27.0)),
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        splashColor: Colors.white,
                        child: const Text(
                          "Cancel",
                          style: TextStyle(fontSize: 22.0, color: Colors.white),
                        )),
                    // This button results in adding the contact to the database
                    RaisedButton(
                        color: Color.fromRGBO(52, 193, 228, 1.0),
                        onPressed: () {
                          fireService
                              .createTODOTask(
                              _taskNameController.text,
                              _taskDetailsController.text,
                              _taskDateController.text,
                              _taskTimeController.text,
                              _myTaskTyp.text)
                              .then((_) {
                            Navigator.pop(context);
                          });
                        },
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(27.0)),
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        splashColor: Colors.white,
                        child: const Text(
                          "Submit",
                          style: TextStyle(fontSize: 22.0, color: Colors.white),
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

  Widget _myAppBar() {
    return Center(
      child: Container(
        color: Colors.lightBlue[50],
        height: 80.0,
        width: MediaQuery.of(context).size.width,
        child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Center(
              child: Container(
                child: Text(
                  'Add New Task',
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
