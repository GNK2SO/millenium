import 'package:millenium/src/models/atributos_combate.dart';
import 'package:millenium/src/models/atributos_exploracao.dart';

class Personagem {
  String jogador_id;
  String id;
  String nome;
  int vida;
  int vidaAtual;
  int energia;
  int energiaAtual;
  int fome;
  int level;
  int xp;
  AtributosCombate atributosCombate;
  AtributosExploracao atributosExploracao;

  Personagem({
    this.jogador_id,
    this.id,
    this.nome,
    this.vida: 20,
    this.vidaAtual: 20,
    this.energia: 6,
    this.energiaAtual: 6,
    this.fome: 5,
    this.level: 1,
    this.xp: 0,
    this.atributosCombate,
    this.atributosExploracao,
  });

  Personagem.fromJson(Map<String, dynamic> json) {
    jogador_id = json['jogador_id'];
    id = json['id'];
    nome = json['nome'];
    vida = json['vida'];
    vidaAtual = json['vidaAtual'];
    energia = json['energia'];
    energiaAtual = json['energiaAtual'];
    fome = json['fome'];
    level = json['level'];
    xp = json['xp'];
    atributosCombate = json['atributosCombate'] != null
        ? new AtributosCombate.fromJson(json['atributosCombate'])
        : null;
    atributosExploracao = json['atributosExploracao'] != null
        ? new AtributosExploracao.fromJson(json['atributosExploracao'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jogador_id'] = this.jogador_id;
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['vida'] = this.vida;
    data['vidaAtual'] = this.vidaAtual;
    data['energia'] = this.energia;
    data['energiaAtual'] = this.energiaAtual;
    data['fome'] = this.fome;
    data['level'] = this.level;
    data['xp'] = this.xp;
    if (this.atributosCombate != null) {
      data['atributosCombate'] = this.atributosCombate.toJson();
    }
    if (this.atributosExploracao != null) {
      data['atributosExploracao'] = this.atributosExploracao.toJson();
    }
    return data;
  }

  int vidaTotal() {
    return this.vida + 5 * (this.atributosCombate.vitality / 5).floor();
  }

  int energiaTotal() {
    return this.energia + 2 * (this.atributosCombate.vitality / 5).floor();
  }
}
