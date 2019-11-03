import 'package:millenium/src/models/personagem/personagem.dart';

class Usuario {
  String uid;
  String nome;
  String email;
  String senha;
  bool isAdmin;
  List<Personagem> personagens;

  Usuario({
    this.uid,
    this.nome,
    this.email,
    this.senha,
    this.isAdmin,
    this.personagens,
  });

  Usuario.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    email = json['email'];
    senha = json['senha'];
    isAdmin = json['isAdmin'];
    if (json['personagem'] != null) {
      personagens = new List<Personagem>();
      json['personagem'].forEach((personagem) {
        personagens.add(new Personagem.fromJson(personagem));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['senha'] = this.senha;
    data['isAdmin'] = this.isAdmin;
    if (this.personagens != null) {
      data['personagens'] = this.personagens.map((personagem) {
        return personagem.toJson();
      }).toList();
    }
    return data;
  }
}
