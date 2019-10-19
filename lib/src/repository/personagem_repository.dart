import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:millenium/src/models/personagem.dart';
import 'package:uuid/uuid.dart';

class PersonagemRepository {
  Firestore _firestore = Firestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _usuarioAtual;

  Future<void> salvar(Personagem personagem) async {
    _usuarioAtual = await _auth.currentUser();
    personagem.jogador_id = _usuarioAtual.uid;
    personagem.id = "${personagem.nome}_${Uuid().v1()}";
    return _firestore
        .collection("personagens")
        .document(personagem.id)
        .setData(personagem.toJson());
  }

  Stream<QuerySnapshot> obterMeusPersonagens(String uid) {
    return _firestore
        .collection("personagens")
        .where("jogador_id", isEqualTo: uid)
        .snapshots();
  }

  Stream<QuerySnapshot> obterTodosPersonagens() {
    return _firestore.collection("personagens").snapshots();
  }

  Future<void> atualizar(Personagem personagem) async {
    _usuarioAtual = await _auth.currentUser();
    return _firestore
        .collection("personagens")
        .document(personagem.id)
        .updateData(personagem.toJson());
  }

  Future<void> remover(Personagem personagem) async {
    _usuarioAtual = await _auth.currentUser();
    return _firestore
        .collection("personagens")
        .document(personagem.id)
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

  Future obterListaUid() async {
    List uids = [];
    await _firestore.collection("users_id").document("uids").get().then((id) {
      uids.add(id.data);
    });
    return uids;
  }
}
