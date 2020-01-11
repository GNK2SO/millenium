import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:millenium/src/models/besta/besta.dart';
import 'package:millenium/src/repository/bestiario_repository.dart';

class BestiarioService {
  final _repository = BestiarioRepository();

  Future<void> salvar(String nomeBesta) async {
    final besta = Besta(nome: nomeBesta);
    await _repository.salvar(besta);
  }

  Future<List<Besta>> obterBestiario() async {
    QuerySnapshot query = await _repository.obterBestiario();
    return mapToList(documents: query.documents);
  }

  Future<void> atualizar(Besta besta) async {
    await _repository.atualizar(besta);
  }

  Future<void> remover(Besta besta) async {
    await _repository.remover(besta);
  }

  List<Besta> mapToList({List<DocumentSnapshot> documents}) {
    List<Besta> personagens = [];
    if (documents != null) {
      documents.forEach((document) {
        String jsonData = json.encode(document.data);
        personagens.add(Besta.fromJson(json.decode(jsonData)));
      });
    }
    return personagens;
  }
}
