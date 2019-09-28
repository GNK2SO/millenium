import 'dart:core';

class Atributos {
  int strenght;
  int dexterity;
  int vitality;
  int intelligence;

  Atributos({this.strenght, this.dexterity, this.vitality, this.intelligence});

  Atributos.fromJson(Map<String, dynamic> json) {
    strenght = json['strenght'];
    dexterity = json['dexterity'];
    vitality = json['vitality'];
    intelligence = json['intelligence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strenght'] = this.strenght;
    data['dexterity'] = this.dexterity;
    data['vitality'] = this.vitality;
    data['intelligence'] = this.intelligence;
    return data;
  }
}
