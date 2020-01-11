import 'package:cloud_firestore/cloud_firestore.dart';

class ClasseRepository {
  Firestore _firestore = Firestore.instance;

  Future<QuerySnapshot> getAll() async {
    return _firestore.collection("classes").getDocuments();
  }

  Future<QuerySnapshot> getBy(String nomeClasse) async {
    return _firestore
        .collection("classes")
        .where("nome", isEqualTo: nomeClasse)
        .getDocuments();
  }
}
