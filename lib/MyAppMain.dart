import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter123/HomeScreen.dart';
import 'package:flutter123/MapScreen.dart';
import 'package:flutter123/MembersScreen.dart';
import 'package:flutter123/ProfilePage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MyAppMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  int _currentIndex0 = 0;

  final List<Widget> _children = [
    MyHomeTasks(),
    MyMembers(), //member
    MyMap(),
    ProfilePage(), //profile
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: currentIndex,
          showElevation: true,
          itemCornerRadius: 20,
          curve: Curves.easeInBack,
          onItemSelected: (index) => setState(() {
            currentIndex = index;
            _currentIndex0 = index;
          }),
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.apps),
              title: Text('Home'),
              activeColor: Color(0x99E2566E),
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.people_outline),
              title: Text('Members'),
              activeColor: Color(0x99E2566E),
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(FontAwesomeIcons.mapMarkedAlt),
              title: Text('Map'),
              activeColor: Color(0x99E2566E),
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
              activeColor: Color(0x99E2566E),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        body: Container(
          child: _children[_currentIndex0],
        )
    );
  }
}
