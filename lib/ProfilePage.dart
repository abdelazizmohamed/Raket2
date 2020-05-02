import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter123/models/brew.dart';
import 'package:flutter123/screens1/home/home.dart';
import 'package:flutter123/screens1/home/settings_form.dart';
import 'package:flutter123/services/auth.dart';
import 'package:flutter123/services/database.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

class ProfilePage extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();
  DatabaseService fire = new DatabaseService();

  @override
  Widget build(BuildContext context) {
    String name, email;
    int number;

    User user = Provider.of<User>(context);
    DatabaseService fire = new DatabaseService(uid: user.uid);
    Firestore.instance.collection('brew').document(user.uid).snapshots();
    fire.userData.listen((UserData snap) {
      name = snap.name;
      email = snap.sugars;
      number = snap.strength;
    });

    return new Scaffold(
      backgroundColor: Color(0x99d6f0f9),
      body: StreamBuilder(
          stream: DatabaseService(uid: user.uid).userData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              UserData userData = snapshot.data;
              return new ListView(
                children: <Widget>[
                  _myAppBar(context),
                  Column(
                    children: <Widget>[
                      new Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
//                        height: MediaQuery.of(context).size.height,
//                        height: 250.0,
                        color: Color(0x99d6f0f9),
                        child: new Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 20.0, top: 16.0),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: new Stack(fit: StackFit.loose, children: <
                                  Widget>[
                                new Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Container(
                                        width: 140.0,
                                        height: 140.0,
                                        decoration: new BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white70,
                                          image: new DecorationImage(
                                            image: new ExactAssetImage(
                                                'assets/as.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        )),
                                  ],
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 90.0, right: 100.0),
                                    child: new Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: <Widget>[
                                        new CircleAvatar(
                                          backgroundColor: Color(0x99E2566E),
                                          radius: 25.0,
                                          child: IconButton(
                                            icon: Icon(Icons.camera_alt),
                                            color: Colors.white,
                                            onPressed: _showSettingsPanel,
                                          ),
                                        )
                                      ],
                                    )),
                              ]),
                            )
                          ],
                        ),
                      ),
                      new Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
//                        height: MediaQuery.of(context).size.height ,
                        color: Color(0x99d6f0f9),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 25.0),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 25.0),
                                  child: new Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          new Text(
                                            'Parsonal Information',
                                            style: TextStyle(
                                                color: Color(0xEEE2566E),
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      new Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          new CircleAvatar(
                                            backgroundColor: Color(0x99E2566E),
                                            radius: 20.0,
                                            child: IconButton(
                                              icon: Icon(Icons.edit),
                                              color: Colors.white,
                                              onPressed: _showSettingsPanel,
                                            ),
                                          )
//                                      _getActionButtons()
//                                      onPressed: () => _showSettingsPanel(),
//                                      _status ? _getEditIcon() : new Container(),
                                        ],
                                      )
                                    ],
                                  )),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
//                                      mainAxisAlignment:
//                                      MainAxisAlignment.start,
//                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          'Name:  ',
                                          style: TextStyle(
                                              color: Color(0xEEE2566E),
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    new Column(
                                      children: <Widget>[
                                        Text(
                                          name,
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.black),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
//                                      mainAxisAlignment:
//                                      MainAxisAlignment.start,
//                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          'Email:  ',
                                          style: TextStyle(
                                              color: Color(0xEEE2566E),
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    new Column(
                                      children: <Widget>[
                                        Text(
                                          email,
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.black),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
//                                      mainAxisAlignment:
//                                      MainAxisAlignment.start,
//                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          'Phone:  ',
                                          style: TextStyle(
                                              color: Color(0xEEE2566E),
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    new Column(
                                      children: <Widget>[
                                        Text(
                                          number.toString(),
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.black),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 80.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        RaisedButton(
                                            color:
                                            Color.fromRGBO(52, 193, 228, 1.0),
                                            onPressed: () {
//                                          Navigator.of(context).pop();
                                            },
                                            shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                new BorderRadius.circular(
                                                    27.0)),
                                            padding:
                                            EdgeInsets.fromLTRB(20, 10, 20, 10),
                                            splashColor: Colors.white,
                                            child: const Text(
                                              "Ongoing Tasks",
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.white),
                                            )),
                                      ],
                                    ),
                                    // This button results in adding the contact to the database
                                    Column(
                                      children: <Widget>[
                                        RaisedButton(
                                          color: Color.fromRGBO(
                                              52, 193, 228, 1.0),
                                          onPressed: () {
//                                        Navigator.pop(context);
                                          },
                                          shape: new RoundedRectangleBorder(
                                              borderRadius:
                                              new BorderRadius.circular(27.0)),
                                          padding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 10),
                                          splashColor: Colors.white,
                                          child: const Text(
                                            "Completed Tasks",
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
//              !_status ? _getActionButtons() : new Container(),
            } else {
              return ListView();
            }
          }),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  void _showSettingsPanel() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: SettingsForm(),
          );
        });
  }

  _getActionButtons() {
    _showSettingsPanel();
//    return Padding(
//      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
//      child: new Row(
//        mainAxisSize: MainAxisSize.max,
//        mainAxisAlignment: MainAxisAlignment.start,
//        children: <Widget>[
//
//          Expanded(
//            child: Padding(
//              padding: EdgeInsets.only(right: 10.0),
//              child: Container(
//                  child: new RaisedButton(
//                    child: new Text("Cancel"),
//                    textColor: Colors.white,
//                    color: Color(0xEEE2566E),
//                    onPressed: () {
//                      setState(() {
//                        _status = true;
//                        FocusScope.of(context).requestFocus(new FocusNode());
//                      });
//                    },
//                    shape: new RoundedRectangleBorder(
//                        borderRadius: new BorderRadius.circular(20.0)),
//                  )),
//            ),
//            flex: 2,
//          ),
//          Expanded(
//            child: Padding(
//              padding: EdgeInsets.only(left: 10.0),
//              child: Container(
//                  child: new RaisedButton(
//                    child: new Text("Save"),
//                    textColor: Colors.white,
//                    color: Color(0x9935c1e3),
//                    onPressed: () {
//                      setState(() {
//                        _status = true;
//                        FocusScope.of(context).requestFocus(new FocusNode());
//                      });
//                    },
//                    shape: new RoundedRectangleBorder(
//                        borderRadius: new BorderRadius.circular(20.0)),
//                  )),
//            ),
//            flex: 2,
//          ),
//        ],
//      ),
//    );
  }

  final AuthService _auth = AuthService();

  _myAppBar(context) {
    return Container(
      color: Color(0x99d6f0f9),
      height: 80,
      width: MediaQuery
          .of(context)
          .size
          .width - 100,
      child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Container(
            child: Row(children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    '                    Profile      ',
                    style: TextStyle(
                        color: Color(0xEEE2566E),
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Color(0x99E2566E),
                    radius: 20.0,
                    child: IconButton(
                      icon: Icon(Icons.exit_to_app),
                      color: Colors.white,
                      onPressed: () async {
                        await _auth.signOut();
                      },
                    ),
                  )
                ],
              ),
            ]),
          )),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Color(0xEEE2566E),
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}
