import 'package:flutter/material.dart';
import 'package:flutter123/services/auth.dart';
import 'package:flutter123/services/database.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'models/brew.dart';

class MyMembers extends StatefulWidget {
  MyMembers({Key key, this.title}) : super(key: key);
  final String title;
  final AuthService _auth = AuthService();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyMembers> {
  @override
  void initState() {
    super.initState();
  }

//  final Brew brew;
//  BrewTile({ this.brew });
//  List<Task> items;
//  FirestoreService fireService = new FirestoreService();
//  StreamSubscription<QuerySnapshot> todoTasks;
//  Firestore firestore = Firestore.instance;

//  @override
//  void initState() {
//    super.initState();
//
//    items = new List();
//    todoTasks?.cancel();
//
//    todoTasks = fireService.getTaskList().listen((QuerySnapshot snapshot) {
//      List<Task> tasks =
//      snapshot.documents
//          .map((documentSnapshot) => Task.fromMap(documentSnapshot.data))
//          .toList();
//
//      setState(() {
//        return this.items = tasks;
//      });
//    });
//  }

//  onTapped(Task post) {

//    Navigator.push(
//      context,
//      MaterialPageRoute(builder: (context) => TaskDetailsScreen(post)),
//    );
//  }

  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context) ?? [];
    return Scaffold(
      backgroundColor: Color(0x99bceaf9),
      resizeToAvoidBottomInset: false,
      body: Column(
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[
//          _myAppBar(context),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery
                .of(context)
                .size
                .height - 140,
            child: ListView.builder(
                itemCount: brews.length,
                itemBuilder: (context, index) {
                  var post = brews[index];
                  return new ListTile(
                    title: new Card(
                      child: Stack(children: <Widget>[
                        Column(children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, right: 30.0),
                            child: Container(
//                              width: MediaQuery.of(context).size.width,
//                              height: 120.0,
                              child: Padding(
                                padding:
                                EdgeInsets.only(top: 10.0, bottom: 10.0),
                                child: Material(
                                  color: Colors.white,
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: <Widget>[
                                          todoType('${brews[index].name}'),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 40.0),
                                            child: Text(
                                              '${brews[index].name}',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 18.0),
                                            ),
                                          ),

//                                          Column(
//                                            mainAxisAlignment:
//                                                MainAxisAlignment.center,
//                                            children: <Widget>[
//                                              Text('',
////                                                '${brews[index].sugars}',
//                                                style: TextStyle(
//                                                    color: Colors.red,
//                                                    fontSize: 18.0,
//                                                    fontWeight:
//                                                        FontWeight.bold),
//                                              ),
//                                              Text('',
////                                                '${brews[index].strength}',
//                                                style: TextStyle(
//                                                    fontWeight: FontWeight.bold,
//                                                    color: Colors.black,
//                                                    fontSize: 16.0),
//                                              ),
//                                            ],
//                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ]),
                    ),
//                    onTap: () => onTapped(post),
                  );
                }),
          ),
        ],
      ),
//      floatingActionButton: FloatingActionButton(
//        backgroundColor: Color(0x9935c1e3),
//        child: Icon(
//          FontAwesomeIcons.tasks,
//          color: Colors.white,
//        ),
//        tooltip: 'Increment',
//        onPressed: () {
//          Navigator.push(
//            context,
//            MaterialPageRoute(
//                builder: (context) => TaskScreen(Task('', '', '', '', '')),
//                fullscreenDialog: true),
//          );
//        },
//      ),
    );
  }

  Widget todoType(String icontype) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: CircleAvatar(
        radius: 35.0,
        backgroundImage: AssetImage('assets/as.png'),
      ),
    );
  }

}
