import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'taskModel.dart';

class FirestoreService {
//  DocumentReference myCollection;
//  String name, details, date, time;
//  FirestoreService(String name, String details, String date, String time) {}

  Future<Task> createTODOTask(String taskname, String taskdetails,
      String taskdate, String tasktime, String tasktype) async {
    DocumentReference myCollection =
    Firestore.instance.collection('todolist').document(taskname);

    final TransactionHandler createTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(myCollection);

      final Task task =
      new Task(taskname, taskdetails, taskdate, tasktime, tasktype);
      final Map<String, dynamic> data = task.toMap();
      await tx.set(ds.reference, data);
      return data;
    };

    return Firestore.instance.runTransaction(createTransaction).then((mapData) {
      return Task.fromMap(mapData);
    }).catchError((error) {
      print('error: $error');
      return null;
    });
  }

  Stream<QuerySnapshot> getTaskList({int offset, int limit}) {
    CollectionReference myCollection = Firestore.instance.collection(
        'todolist');
    Stream<QuerySnapshot> snapshots = myCollection.snapshots();

    if (offset != null) {
      snapshots = snapshots.skip(offset);
    }
    if (limit != null) {
      snapshots = snapshots.take(limit);
    }
    return snapshots;
  }
}
