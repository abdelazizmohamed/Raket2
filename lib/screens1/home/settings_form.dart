import 'package:flutter/cupertino.dart';
import 'package:flutter123/models/user.dart';
import 'package:flutter123/services/database.dart';
import 'package:flutter123/shared/constants.dart';
import 'package:flutter123/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final String sugars = 'Email';
  final String strengths = 'Number';

  // form values
  String _currentName;
  String _currentSugars;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,

//      backgroundColor: Colors.lightBlue[50],
      body: Container(
        child: StreamBuilder<UserData>(
            stream: DatabaseService(uid: user.uid).userData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                UserData userData = snapshot.data;
                return Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'Update your profile',
                            style: TextStyle(
                                color: Color(0x99E2566E),
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            initialValue: userData.name,
//                    decoration: textInputDecoration,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.lightBlue[50],
                              hintText: 'Enter your name',
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 20.0, top: 20.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black45),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.lightBlue[50]),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                            ),
//                    validator: (val) =>
//                        val.isEmpty ? 'Please enter a name' : null,
                            onChanged: (val) =>
                                setState(() => _currentName = val),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            initialValue: _currentSugars ?? userData.sugars,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.lightBlue[50],
                              hintText: 'Enter your email',
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 20.0, top: 20.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black45),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.lightBlue[50]),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                            ),
//                    validator: (val) =>
//                        val.isEmpty ? 'Please enter your email' : null,
                            onChanged: (val) =>
                                setState(() => _currentSugars = val),

//                  value: _currentSugars ?? userData.sugars,
//                  decoration: textInputDecoration,
//                  items: sugars.map((sugar) {
//                    return DropdownMenuItem(
//                      value: sugar,
//                      child: Text('$sugar sugars'),
//                    );
//                  }).toList(),
//                  onChanged: (val) => setState(() => _currentSugars = val ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            initialValue:
                                (_currentStrength ?? userData.strength)
                                    .toString(),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.lightBlue[50],
                              hintText: 'Enter your phone number',
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 20.0, top: 20.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black45),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.lightBlue[50]),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                            ),
//                    decoration: textInputDecoration,
//                    validator: (val) =>
//                        val.isEmpty ? 'Please enter your number' : null,
                            onChanged: (val) => setState(
                                () => _currentStrength = int.parse(val)),
                          ),
                        ),
//                Slider(
//                  value: (_currentStrength ?? userData.strength).toDouble(),
//                  activeColor: Colors.brown[_currentStrength ?? userData.strength],
//                  inactiveColor: Colors.brown[_currentStrength ?? userData.strength],
//                  min: 100.0,
//                  max: 900.0,
//                  divisions: 8,
//                  onChanged: (val) => setState(() => _currentStrength = val.round()),
//                ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: RaisedButton(
                              color: Color(0x99E2566E),
                              child: Text(
                                'Update',
                                style: TextStyle(color: Colors.white),
                              ),
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(27.0)),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  await DatabaseService(uid: user.uid)
                                      .updateUserData(
                                          _currentSugars ??
                                              snapshot.data.sugars,
                                          _currentName ?? snapshot.data.name,
                                          _currentStrength ??
                                              snapshot.data.strength);
                                  Navigator.pop(context);
                                }
                              }),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Loading();
              }
            }),
      ),
    );
  }
}
