import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:millenium/src/models/personagem.dart';

class PersonagemRepository {
  Firestore _firestore = Firestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _usuarioAtual;

  Future<void> salvar(Personagem personagem) async {
    _usuarioAtual = await _auth.currentUser();
    return _firestore
        .collection("jogadores")
        .document(_usuarioAtual.uid)
        .collection("personagens")
        .document(personagem.nome)
        .setData(personagem.toJson());
  }

  Stream<QuerySnapshot> obterTodosPersonagens(String uid) {
    return _firestore
        .collection("jogadores")
        .document(uid)
        .collection("personagens")
        .snapshots();
  }

  Future<void> atualizar(Personagem personagem) async {
    _usuarioAtual = await _auth.currentUser();
    return _firestore
        .collection("jogadores")
        .document(_usuarioAtual.uid)
        .collection("personagens")
        .document(personagem.nome)
        .updateData(personagem.toJson());
  }

  Future<void> remover(Personagem personagem) async {
    _usuarioAtual = await _auth.currentUser();
    return _firestore
        .collection("jogadores")
        .document(_usuarioAtual.uid)
        .collection("personagens")
        .document(personagem.nome)
        .delete();
  }

  Stream<DocumentSnapshot> obterPersonagem(String uid, String nome) {
    return _firestore
        .collection("jogadores")
        .document(uid)
        .collection("personagens")
        .document(nome)
        .snapshots();
  }
}
