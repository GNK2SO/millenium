import 'package:json_annotation/json_annotation.dart';
import 'package:millenium/src/models/atributos_combate/atributos_combate.dart';
import 'package:millenium/src/models/atributos_exploracao/atributos_exploracao.dart';
import 'package:millenium/src/models/consumivel/consumivel.dart';
import 'package:millenium/src/models/equipamento/arma/arma.dart';
import 'package:millenium/src/models/equipamento/armadura/armadura.dart';
import 'package:millenium/src/models/item/item.dart';
import 'package:millenium/src/util/constantes.dart';

part 'personagem.g.dart';

@JsonSerializable()
class Personagem {
  String jogadorId;
  String id;
  String nome;
  int vida;
  int vidaAtual;
  int energia;
  int energiaAtual;
  int mana;
  int manaAtual;
  int fome;
  bool karma;
  String imagem;
  AtributosCombate atributosCombate;
  AtributosExploracao atributosExploracao;
  List bolsa;
  List equipamentos;

  Personagem({
    this.imagem,
    this.jogadorId,
    this.id,
    this.nome,
    this.vida: 20,
    this.energia: 6,
    this.mana: 0,
    this.fome: 5,
    this.karma,
    this.atributosCombate,
    this.atributosExploracao,
    this.bolsa: const [],
    this.equipamentos: const [],
  });

  factory Personagem.fromJson(Map<String, dynamic> json) =>
      _$PersonagemFromJson(json);

  Map<String, dynamic> toJson() => _$PersonagemToJson(this);

  int vidaTotal() {
    return vidaBase + 5 * this.atributosCombate.vitality;
  }

  int energiaTotal() {
    return energiaBase + 2 * (this.atributosCombate.vitality / 5).floor();
  }

  int manaTotal() {
    return 5 * (this.atributosCombate.intelligence / 5).floor();
  }

  int dano() {
    int dano;

    equipamentos.forEach((item) {
      if (item is Arma) {
        dano = item.dano;
      }
    });

    return dano ?? 0;
  }

  int defesa() {
    int defesa = 0;

    equipamentos.forEach((item) {
      if (item is Armadura) {
        defesa += item.defesa;
      }
    });
    return defesa;
  }

  int resistenciaFrio() {
    int resistenciaFrio = 0;

    return resistenciaFrio;
  }

  bool isMagiaUnlocked() {
    return this.atributosExploracao.magia >= 10;
  }

  @override
  String toString() => "Personagem { id: $id}";
}
