import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:millenium/src/models/besta/besta.dart';

class BestiarioRepository {
  Firestore _firestore = Firestore.instance;

  Future<void> salvar(Besta besta) async {
    return _firestore
        .collection("bestiario")
        .document(besta.id)
        .setData(besta.toJson());
  }

  Future<QuerySnapshot> obterBestiario() {
    return _firestore.collection("bestiario").getDocuments();
  }

  Future<void> atualizar(Besta besta) async {
    return _firestore
        .collection("bestiario")
        .document(besta.id)
        .updateData(besta.toJson());
  }

  Future<void> remover(Besta besta) async {
    return _firestore.collection("bestiario").document(besta.id).delete();
  }
}
