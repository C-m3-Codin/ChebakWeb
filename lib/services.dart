// import 'package:chebank/datamodelobj.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testweb/datamodelobj.dart';

class DatabaseService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  // Stream<List<QrObj>> geDateofMatche() {
  //   return _db
  //       .collection("Transcations")
  //       // .orderBy("matchNo", descending: true)
  //       .snapshots()
  //       .map((snapshot) => snapshot.docs
  //           .map((documents) => QrObj.fromJson(documents.data()))
  //           .toList());
  // }

  Stream<List<QrObj>> geDateofMatchetest() {
    return _db
        .collection("Transcations")
        // .orderBy("matchNo", descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((documents) =>
                QrObj.fromJson(documents.data(), documents.id.toString()))
            .toList());
  }
}
