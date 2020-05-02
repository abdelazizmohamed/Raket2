import 'package:flutter/cupertino.dart';
import 'package:flutter123/services/auth.dart';
import 'package:flutter123/shared/constants.dart';
import 'package:flutter123/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height - 100,
              padding:
              EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 100),
                      child: Column(children: <Widget>[
                        Hero(
                          tag: 'logo',
                          child: Container(
                            height: 150,
                            child: Image.asset('assets/Raket_round.png'),
                          ),
                        ),
                        Text(
                          'Register to Raket',
                          style: TextStyle(
                              fontSize: 25,
                              color: Color.fromRGBO(226, 86, 110, 1),
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                    ),
                    SizedBox(height: 30.0),
                    SizedBox(
                      width: 800,
                      height: 50,
                      child: TextFormField(
                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Email',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        validator: (val) =>
                        val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                    ),
                    SizedBox(height: 10.0),
                    SizedBox(
                      width: 800,
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0, bottom: 0),
                        child: TextFormField(
                          style: TextStyle(fontSize: 15),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Password',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.cyan),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.cyan),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          obscureText: true,
                          validator: (val) =>
                          val.length < 6
                              ? 'Enter a password 6+ chars long'
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: EdgeInsets.all(0.0),
                      child: SizedBox(
                        width: 800,
                        height: 45,
                        child: RaisedButton(
                            color: Color.fromRGBO(52, 193, 228, 1.0),
                            shape: new RoundedRectangleBorder(
                                borderRadius:
                                new BorderRadius.circular(27.0)),
//                                padding: EdgeInsets.fromLTRB(167, 11, 167, 11),
                            splashColor: Colors.white,
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                  fontSize: 22.0, color: Colors.white),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);
                                dynamic result = await _auth
                                    .registerWithEmailAndPassword(
                                    email, password);
                                if (result == null) {
                                  setState(() {
                                    loading = false;
                                    error = 'Please supply a valid email';
                                  });
                                }
                              }
                            }),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                    SizedBox(
                      width: 800,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: SizedBox(
                                width: 135,
                                height: 40,
                                child: RaisedButton(
//                                    borderSide: BorderSide(
//                                        color: Color.fromRGBO(22, 168, 252, 1.0)),
                                  onPressed: () async {},
                                  color:
                                  Color.fromRGBO(22, 168, 252, 1.0),
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                    new BorderRadius.circular(27.0),
                                  ),
//                                      padding:
//                                          EdgeInsets.fromLTRB(50, 11, 50, 11),
                                  splashColor: Colors.white,
                                  child: const Text(
                                    "Facebook",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 12.0),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: SizedBox(
                                width: 135,
                                height: 40,
                                child: RaisedButton(
//                                    borderSide: BorderSide(
//                                        color: Color.fromRGBO(206, 87, 76, 1.0)),
                                  onPressed: () async {},
                                  color: Color.fromRGBO(206, 87, 76, 1.0),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                      new BorderRadius.circular(
                                          27.0)),
//                                      padding:
//                                          EdgeInsets.fromLTRB(70, 11, 70, 11),
                                  splashColor: Colors.white,
                                  child: const Text(
                                    "Gmail",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
