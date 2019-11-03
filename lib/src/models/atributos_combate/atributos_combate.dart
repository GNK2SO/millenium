import 'package:json_annotation/json_annotation.dart';

part 'atributos_combate.g.dart';

@JsonSerializable()
class AtributosCombate {
  int pontosDistribuicao;
  int strenght;
  int agility;
  int dexterity;
  int vitality;
  int intelligence;
  int magia;
  bool isMagiaUnlocked;

  AtributosCombate({
    this.pontosDistribuicao: 0,
    this.strenght: 0,
    this.agility: 0,
    this.dexterity: 0,
    this.vitality: 0,
    this.intelligence: 0,
    this.magia: 0,
    this.isMagiaUnlocked: false,
  });

  factory AtributosCombate.fromJson(Map<String, dynamic> json) =>
      _$AtributosCombateFromJson(json);

  Map<String, dynamic> toJson() => _$AtributosCombateToJson(this);

  @override
  String toString() {
    return '''{
        strength: ${this.strenght},
        agility: ${this.agility},
        dexterity: ${this.dexterity},
        vitality: ${this.vitality},
        intelligence: ${this.intelligence},
        magia: ${this.magia},
      }
    ''';
  }
}
