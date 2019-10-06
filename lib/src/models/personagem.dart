import 'package:millenium/src/models/atributos.dart';

class Personagem {
  String nome;
  int vida;
  int energia;
  int level;
  int xp;
  Atributos atributos;

  Personagem({
    this.nome,
    this.vida: 20,
    this.energia: 6,
    this.level: 0,
    this.xp: 0,
    this.atributos,
  });

  Personagem.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    vida = json['vida'];
    energia = json['energia'];
    level = json['level'];
    xp = json['xp'];
    atributos = json['atributos'] != null
        ? new Atributos.fromJson(json['atributos'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['vida'] = this.vida;
    data['energia'] = this.energia;
    data['level'] = this.level;
    data['xp'] = this.xp;
    if (this.atributos != null) {
      data['atributos'] = this.atributos.toJson();
    }
    return data;
  }
}
