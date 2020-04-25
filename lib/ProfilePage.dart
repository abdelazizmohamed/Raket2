import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProfilePage extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor:Color(0x99d6f0f9),
        body: new Container(
      color: Color(0x99d6f0f9),
      child: new ListView(
        children: <Widget>[
          _myAppBar(context),
          Column(
            children: <Widget>[
              new Container(
                height: 250.0,
                color: Color(0x99d6f0f9),
                child: new Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, top: 20.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: new Stack(fit: StackFit.loose, children: <Widget>[
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
                                        'assets/images/as.png'),
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 90.0, right: 100.0),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new CircleAvatar(
                                  backgroundColor: Color(0x99E2566E),
                                  radius: 25.0,
                                  child: new Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Parsonal Information',
                                    style: TextStyle(
                                        color: Color(0xEEE2566E),
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  _status ? _getEditIcon() : new Container(),
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Name',
                                    style: TextStyle(
                                        color: Color(0xEEE2566E),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 2.0),
                          child: new Row(
//                                mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: TextField(
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black),
                                  autocorrect: true,
//                                    controller: _taskDetailsController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.cyanAccent[50],
                                    hintText: "Enter Your Name",
                                    contentPadding: const EdgeInsets.only(
                                        left: 15.0, bottom: 10.0, top: 10.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide( color: Colors.black26),
                                      borderRadius: BorderRadius.circular(27.7),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.cyanAccent),
                                      borderRadius: BorderRadius.circular(27.7),
                                    ),
                                  ),
                                  enabled: !_status,
                                    autofocus: !_status,
                                ),
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Email',
                                    style: TextStyle(
                                        color: Color(0xEEE2566E),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: TextField(
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black),
                                  autocorrect: true,
//                                    controller: _taskDetailsController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.cyanAccent[50],
                                    hintText: 'Enter Email',
                                    contentPadding: const EdgeInsets.only(
                                        left: 15.0, bottom: 10.0, top: 10.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.black26),
                                      borderRadius: BorderRadius.circular(27.7),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.cyanAccent),
                                      borderRadius: BorderRadius.circular(27.7),
                                    ),
                                  ),
                                  enabled: !_status,
                                  autofocus: !_status,
                                ),
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Mobile',
                                    style: TextStyle(
                                        color: Color(0xEEE2566E),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),

                      Padding(
                          padding: EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: TextField(
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.black45),
                                  autocorrect: true,
//                                    controller: _taskDetailsController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.cyanAccent[50],
                                    hintText: 'Enter Mobile Number',
                                    contentPadding: const EdgeInsets.only(
                                        left: 15.0, bottom: 10.0, top: 10.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.black26),
                                      borderRadius: BorderRadius.circular(27.7),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.cyanAccent),
                                      borderRadius: BorderRadius.circular(27.7),
                                    ),
                                  ),
                                  enabled: !_status,
                                  autofocus: !_status,
                                ),
                              ),
                            ],
                          )),
                      !_status ? _getActionButtons() : new Container(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Save"),
                textColor: Colors.white,
                color: Color(0x9935c1e3),
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Cancel"),
                textColor: Colors.white,
                    color: Color(0xEEE2566E),
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
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
                  'Profile',
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

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor:  Color(0xEEE2566E),
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
