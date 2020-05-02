import 'package:flutter/material.dart';

class MyMap extends StatefulWidget {
  MyMap({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyMap> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0x99bceaf9),
        resizeToAvoidBottomInset: false,
        body: Column(textBaseline: TextBaseline.alphabetic, children: <Widget>[
          _myAppBar(context),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 150,
          ),
        ]));
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
                  'Map',
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
