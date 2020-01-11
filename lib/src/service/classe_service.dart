import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:millenium/src/models/classe/classe.dart';
import 'package:millenium/src/repository/classe_repository.dart';

class ClasseService {
  final ClasseRepository repository = ClasseRepository();

  Future<List<Classe>> obterClasses() async {
    QuerySnapshot query = await repository.getAll();
    return mapToList(query.documents);
  }

  Future<Classe> obterClasse(String nomeClasse) async {
    QuerySnapshot query = await repository.getBy(nomeClasse);
    return mapToList(query.documents).first;
  }

  List<Classe> mapToList(List<DocumentSnapshot> documents) {
    List<Classe> classes = [];
    if (documents != null) {
      documents.forEach((document) {
        String jsonData = json.encode(document.data);
        classes.add(Classe.fromJson(json.decode(jsonData)));
      });
    }
    return classes;
  }
}
