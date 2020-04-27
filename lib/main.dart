import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter123/MyAppMain.dart';
import 'package:splashscreen/splashscreen.dart';


void main() {
//  sleep(const Duration(seconds:10));
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => new _MyAppState();

}


class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 0,
      navigateAfterSeconds: new AfterSplash(),
      image: new Image.asset('assets/Raket_round.png'),
      backgroundColor: Color.fromRGBO(52, 193, 228, 1.0),
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 70.0,
      loaderColor: Colors.white70,
    );
  }
}

class AfterSplash extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'screen',
      routes: {
//        'screen': (context) =>MyFireApp(),
        'screen': (context) => MyAppMain(),
      },
    );
  }
}
