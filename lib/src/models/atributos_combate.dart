import 'dart:core';

class AtributosCombate {
  int pontosDistribuicao;
  int strenght;
  int dexterity;
  int vitality;
  int intelligence;

  AtributosCombate({
    this.pontosDistribuicao: 0,
    this.strenght: 0,
    this.dexterity: 0,
    this.vitality: 0,
    this.intelligence: 0,
  });

  AtributosCombate.fromJson(Map<String, dynamic> json) {
    pontosDistribuicao = json['pontosDistribuicao'];
    strenght = json['strenght'];
    dexterity = json['dexterity'];
    vitality = json['vitality'];
    intelligence = json['intelligence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pontosDistribuicao'] = this.pontosDistribuicao;
    data['strenght'] = this.strenght;
    data['dexterity'] = this.dexterity;
    data['vitality'] = this.vitality;
    data['intelligence'] = this.intelligence;
    return data;
  }

  @override
  String toString() {
    return '''{
        strength: ${this.strenght},
        dexterity: ${this.dexterity},
        vitality: ${this.vitality},
        intelligence: ${this.intelligence},
      }
    ''';
  }
}
