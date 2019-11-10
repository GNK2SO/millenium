// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personagem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Personagem _$PersonagemFromJson(Map<String, dynamic> json) {
  return Personagem(
    imagem: json['imagem'] as String,
    jogadorId: json['jogadorId'] as String,
    id: json['id'] as String,
    nome: json['nome'] as String,
    vida: json['vida'] as int,
    vidaAtual: json['vidaAtual'] as int,
    energia: json['energia'] as int,
    energiaAtual: json['energiaAtual'] as int,
    mana: json['mana'] as int,
    manaAtual: json['manaAtual'] as int,
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
    bolsa: json['bolsa'].map((item) {
      if (item['tipo'] == "Arma") {
        return Arma.fromJson(item);
      } else if (item['tipo'] == "Armadura") {
        return Armadura.fromJson(item);
      } else if (item['tipo'] == "Consumivel") {
        return Consumivel.fromJson(item);
      } else {
        return Item.fromJson(item);
      }
    }).toList(),
    equipamentos: json['equipamentos'].map((item) {
      if (item['tipo'] == "Arma") {
        return Arma.fromJson(item);
      } else if (item['tipo'] == "Armadura") {
        return Armadura.fromJson(item);
      } else if (item['tipo'] == "Consumivel") {
        return Consumivel.fromJson(item);
      } else {
        return Item.fromJson(item);
      }
    }).toList(),
  );
}

Map<String, dynamic> _$PersonagemToJson(Personagem instance) =>
    <String, dynamic>{
      'imagem': instance.imagem,
      'jogadorId': instance.jogadorId,
      'id': instance.id,
      'nome': instance.nome,
      'vida': instance.vida,
      'vidaAtual': instance.vidaAtual,
      'energia': instance.energia,
      'energiaAtual': instance.energiaAtual,
      'mana': instance.mana,
      'manaAtual': instance.manaAtual,
      'fome': instance.fome,
      'level': instance.level,
      'xp': instance.xp,
      'atributosCombate': instance.atributosCombate.toJson(),
      'atributosExploracao': instance.atributosExploracao.toJson(),
      'bolsa': instance.bolsa != null
          ? instance.bolsa.map((item) => item.toJson()).toList()
          : null,
      'equipamentos': instance.equipamentos != null
          ? instance.equipamentos.map((item) => item.toJson()).toList()
          : null,
    };
