import 'package:flutter123/screens1/wrapper.dart';
import 'package:flutter123/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter123/models/user.dart';

void main() => runApp(MyFireApp());

class MyFireApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(), //
      ),
    );
  }
}
