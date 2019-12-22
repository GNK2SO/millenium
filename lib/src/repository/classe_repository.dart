import 'package:cloud_firestore/cloud_firestore.dart';

class ClasseRepository {
  Firestore _firestore = Firestore.instance;

  Future<QuerySnapshot> obterClasses() async {
    return _firestore.collection("classes").getDocuments();
  }
}
