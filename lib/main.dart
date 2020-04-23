import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter123/MyAppMain.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: 'screen',
      routes: {
        'screen': (context) => MyAppMain(),
      },
    );
  }
}
