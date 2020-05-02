import 'package:flutter123/MembersScreen.dart';
import 'package:flutter123/ProfilePage.dart';
import 'package:flutter123/models/brew.dart';
import 'package:flutter123/screens1/home/brew_list.dart';
import 'package:flutter123/screens1/home/settings_form.dart';
import 'package:flutter123/services/auth.dart';
import 'package:flutter123/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
//          child: SettingsForm(),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Center(
            child: Container(
//              width: MediaQuery.of(context).size.width,
//              height: MediaQuery.of(context).size.height -2000 ,
              height: 50,
              child: Text(
                'Members',
                style: TextStyle(
                    color: Color(0xEEE2566E),
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0),
              ),
            ),
          ),
          backgroundColor: Color(0x99bceaf9),
          elevation: 0.0,
//          actions: <Widget>[
//            FlatButton.icon(
//              icon: Icon(Icons.person),
//              label: Text('logout'),
//              onPressed: () async {
//                await _auth.signOut();
//              },
//            ),
//            FlatButton.icon(
//              icon: Icon(Icons.settings),
//              label: Text('settings'),
////              onPressed: () => _showSettingsPanel(),
//              onPressed: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                      builder: (context) => ProfilePage(),
//                      fullscreenDialog: true),
//                );
//              },
//            )
//          ],
//        ),
        ),
        body: Container(

//          child: BrewList()
            child: MyMembers()),
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
                  'Members',
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
