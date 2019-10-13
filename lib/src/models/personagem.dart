import 'package:millenium/src/models/atributos.dart';

class Personagem {
  String nome;
  int vida;
  int vidaAtual;
  int energia;
  int energiaAtual;
  int level;
  int xp;
  Atributos atributos;

  Personagem({
    this.nome,
    this.vida: 20,
    this.vidaAtual: 20,
    this.energia: 6,
    this.energiaAtual: 6,
    this.level: 0,
    this.xp: 0,
    this.atributos,
  });

  Personagem.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    vida = json['vida'];
    vidaAtual = json['vidaAtual'];
    energia = json['energia'];
    energiaAtual = json['energiaAtual'];
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
    data['vidaAtual'] = this.vidaAtual;
    data['energia'] = this.energia;
    data['energiaAtual'] = this.energiaAtual;
    data['level'] = this.level;
    data['xp'] = this.xp;
    if (this.atributos != null) {
      data['atributos'] = this.atributos.toJson();
    }
    return data;
  }

  int vidaTotal() {
    return this.vida + 5 * (this.atributos.vitality / 5).floor();
  }

  int energiaTotal() {
    return this.energia + 2 * (this.atributos.vitality / 5).floor();
  }
}
