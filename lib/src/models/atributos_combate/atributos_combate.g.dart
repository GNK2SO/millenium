// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'atributos_combate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AtributosCombate _$AtributosCombateFromJson(Map<String, dynamic> json) {
  return AtributosCombate(
    pontosDistribuicao: json['pontosDistribuicao'] as int,
    strenght: json['strenght'] as int,
    agility: json['agility'] as int,
    dexterity: json['dexterity'] as int,
    vitality: json['vitality'] as int,
    intelligence: json['intelligence'] as int,
  );
}

Map<String, dynamic> _$AtributosCombateToJson(AtributosCombate instance) =>
    <String, dynamic>{
      'pontosDistribuicao': instance.pontosDistribuicao,
      'strenght': instance.strenght,
      'agility': instance.agility,
      'dexterity': instance.dexterity,
      'vitality': instance.vitality,
      'intelligence': instance.intelligence,
    };
