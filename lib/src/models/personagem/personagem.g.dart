// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personagem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Personagem _$PersonagemFromJson(Map<String, dynamic> json) {
  return Personagem(
    jogadorId: json['jogadorId'] as String,
    id: json['id'] as String,
    nome: json['nome'] as String,
    vida: json['vida'] as int,
    vidaAtual: json['vidaAtual'] as int,
    energia: json['energia'] as int,
    energiaAtual: json['energiaAtual'] as int,
    fome: json['fome'] as int,
    level: json['level'] as int,
    xp: json['xp'] as int,
    atributosCombate: json['atributosCombate'] == null
        ? null
        : AtributosCombate.fromJson(
            json['atributosCombate'] as Map<String, dynamic>),
    atributosExploracao: json['atributosExploracao'] == null
        ? null
        : AtributosExploracao.fromJson(
            json['atributosExploracao'] as Map<String, dynamic>),
    bolsa: (json['bolsa'] as List).map((item) {
      switch (item['tipo']) {
        case 'Item':
          return Item.fromJson(item);
        case 'Consumível':
          return Consumivel.fromJson(item);
        case 'Arma':
          return Arma.fromJson(item);
        case 'Armadura':
          return Armadura.fromJson(item);
        default:
          return null;
      }
    }).toList(),
    equipamentos: (json['equipamentos'] as List).map((item) {
      switch (item['tipo']) {
        case 'Arma':
          return Arma.fromJson(item);
        case 'Armadura':
          return Armadura.fromJson(item);
        default:
          return null;
      }
    }).toList(),
  );
}

Map<String, dynamic> _$PersonagemToJson(Personagem instance) =>
    <String, dynamic>{
      'jogadorId': instance.jogadorId,
      'id': instance.id,
      'nome': instance.nome,
      'vida': instance.vida,
      'vidaAtual': instance.vidaAtual,
      'energia': instance.energia,
      'energiaAtual': instance.energiaAtual,
      'fome': instance.fome,
      'level': instance.level,
      'xp': instance.xp,
      'atributosCombate': instance.atributosCombate.toJson(),
      'atributosExploracao': instance.atributosExploracao.toJson(),
      'bolsa': instance.bolsa.map((item) => item.toJson()).toList(),
      'equipamentos':
          instance.equipamentos.map((item) => item.toJson()).toList(),
    };
