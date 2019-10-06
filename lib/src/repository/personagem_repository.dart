import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:millenium/src/models/personagem.dart';
import 'package:millenium/src/models/usuario.dart';

class PersonagemRepository {
  Firestore _firestore = Firestore.instance;

  Future<void> salvar(Personagem personagem, String idUsuario) async {
    return _firestore
        .collection("jogadores")
        .document(idUsuario)
        .collection("personagens")
        .document(personagem.nome)
        .setData(personagem.toJson());
  }

  Future<DocumentSnapshot> obterTodosPersonagens(Usuario usuario) async {
    DocumentSnapshot snapshot =
        await _firestore.collection("jogadores").document(usuario.uid).get();
    print(snapshot.data);
  }
}
