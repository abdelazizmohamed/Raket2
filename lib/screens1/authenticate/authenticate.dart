import 'package:flutter123/screens1/authenticate/register.dart';
import 'package:flutter123/screens1/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    //print(showSignIn.toString());
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
//    if (showSignIn) {
//      return SignIn(toggleView:  toggleView);
//    } else {
//      return Register(toggleView:  toggleView);
//    }
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(70, 200, 0, 40),
                  child: SizedBox(
                    width: 300,
                    child: Row(
                      children: <Widget>[
                        Hero(
                          tag: 'logo',
                          child: Container(
                            height: 60,
                            child: Image.asset('assets/Raket_round.png'),
                          ),
                        ),
                        Text(
                          'Raket',
                          style: TextStyle(
                              fontSize: 60,
                              color: Color.fromRGBO(226, 86, 110, 1),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: SizedBox(
                            width: 300,
                            height: 50,
                            child: RaisedButton(
                                color: Color.fromRGBO(52, 193, 228, 1.0),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignIn(),
                                        fullscreenDialog: true),
                                  );
                                },
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(27.0)),
//                            padding: EdgeInsets.fromLTRB(161, 11, 161, 11),
                                splashColor: Colors.white,
                                child: const Text(
                                  "Log In",
                                  style: TextStyle(
                                      fontSize: 22.0, color: Colors.white),
                                )),
                          ),
                        ),
                        // This button results in adding the contact to the database
                      ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 300),
                      child: SizedBox(
                        width: 300,
                        height: 50,
                        child: RaisedButton(
                            color: Color.fromRGBO(52, 193, 228, 1.0),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register(),
                                    fullscreenDialog: true),
                              );
                            },
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(27.0)),
//                        padding: EdgeInsets.fromLTRB(150, 11, 150, 11),
                            splashColor: Colors.white,
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                  fontSize: 22.0, color: Colors.white),
                            )),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
