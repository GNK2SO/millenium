import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:millenium/src/models/atributos_combate/atributos_combate.dart';
import 'package:millenium/src/models/atributos_exploracao/atributos_exploracao.dart';
import 'package:millenium/src/models/personagem/personagem.dart';
import 'package:millenium/src/repository/personagem_repository.dart';

class PersonagemService {
  final _repository = PersonagemRepository();

  Future<void> salvar(String nomePersonagem) async {
    final personagem = Personagem(
      nome: nomePersonagem,
      atributosCombate: AtributosCombate(),
      atributosExploracao: AtributosExploracao(),
    );

    await _repository.salvar(personagem);
  }

  Future<Personagem> obterPersonagem(String idPersonagem) async {
    DocumentSnapshot document = await _repository.obterPor(idPersonagem);
    String data = json.encode(document.data);
    return Personagem.fromJson(json.decode(data));
  }

  Future<List<Personagem>> obterPersonagensPor(String idUsuario) async {
    QuerySnapshot document = await _repository.obterPersonagensPor(idUsuario);
    return mapToList(documents: document.documents);
  }

  Future<List<Personagem>> obterTodosPersonagens() async {
    QuerySnapshot document = await _repository.obterTodosPersonagens();
    return mapToList(documents: document.documents);
  }

  Future<void> atualizar(Personagem personagem) async {
    await _repository.atualizar(personagem);
  }

  Future<void> remover(Personagem personagem) async {
    await _repository.remover(personagem);
  }

  List<Personagem> mapToList({List<DocumentSnapshot> documents}) {
    List<Personagem> personagens = [];
    if (documents != null) {
      documents.forEach((document) {
        String jsonData = json.encode(document.data);
        personagens.add(Personagem.fromJson(json.decode(jsonData)));
      });
    }
    return personagens;
  }
}
