import 'package:json_annotation/json_annotation.dart';
import 'package:millenium/src/models/atributos_combate/atributos_combate.dart';
import 'package:millenium/src/models/atributos_exploracao/atributos_exploracao.dart';
import 'package:millenium/src/models/consumivel/consumivel.dart';
import 'package:millenium/src/models/equipamento/arma/arma.dart';
import 'package:millenium/src/models/equipamento/armadura/armadura.dart';
import 'package:millenium/src/models/equipamento/capa/capa.dart';
import 'package:millenium/src/models/habilidade/habilidade.dart';
import 'package:millenium/src/models/item/item.dart';
import 'package:millenium/src/util/constantes.dart';

part 'personagem.g.dart';

@JsonSerializable()
class Personagem {
  String jogadorId;
  String id;
  String nome;
  String titulo;
  String classe;
  int vida;
  int energia;
  int mana;
  int fome;
  bool karma;
  String imagem;
  AtributosCombate atributosCombate;
  AtributosExploracao atributosExploracao;
  List bolsa;
  List equipamentos;
  int pontosHabilidade;
  List<Habilidade> habilidades;

  Personagem({
    this.jogadorId,
    this.id,
    this.nome,
    this.titulo: "",
    this.classe: "",
    this.vida: vidaBase,
    this.energia: energiaBase,
    this.mana: 0,
    this.fome: 5,
    this.karma: false,
    this.imagem,
    this.atributosCombate,
    this.atributosExploracao,
    this.bolsa: const [],
    this.equipamentos: const [],
    this.pontosHabilidade: 0,
    this.habilidades: const [],
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
    int dano = 0;

    equipamentos.forEach((item) {
      if (item is Arma) {
        dano = item.dano;
      }
    });

    return dano;
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

    equipamentos.forEach((item) {
      if (item is Capa) {
        resistenciaFrio = item.resistenciaFrio;
      }
    });

    return resistenciaFrio;
  }

  int chanceEsquiva() {
    return (this.atributosCombate.agility / 5).floor();
  }

  int chanceAcertoCritico() {
    return (this.atributosCombate.dexterity / 5).floor();
  }

  bool isMagiaUnlocked() {
    return this.atributosExploracao.magia >= 10;
  }

  @override
  String toString() => "Personagem { id: $id, nome: $nome }";
}
