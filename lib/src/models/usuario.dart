import 'package:millenium/src/models/personagem.dart';

class Usuario {
  String uid;
  String nome;
  String email;
  String senha;
  List<Personagem> personagens;

  Usuario({this.uid, this.nome, this.email, this.senha, this.personagens});

  Usuario.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    email = json['email'];
    senha = json['senha'];
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
    if (this.personagens != null) {
      data['personagens'] = this.personagens.map((personagem) {
        return personagem.toJson();
      }).toList();
    }
    return data;
  }
}
