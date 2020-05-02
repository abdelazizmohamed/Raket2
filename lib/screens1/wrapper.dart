import 'package:flutter123/MembersScreen.dart';
import 'package:flutter123/MyAppMain.dart';
import 'package:flutter123/models/user.dart';
import 'package:flutter123/screens1/authenticate/authenticate.dart';
import 'package:flutter123/screens1/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../HomeScreen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    // return either the Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return MyAppMain();
    }
  }
}
