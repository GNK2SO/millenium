// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumivel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Consumivel _$ConsumivelFromJson(Map<String, dynamic> json) {
  return Consumivel(
    nome: json['nome'] as String,
    descricao: json['descricao'] as String,
    tipo: json['tipo'] as String,
    vida: json['vida'] as int,
    energia: json['energia'] as int,
    mana: json['mana'] as int,
  );
}

Map<String, dynamic> _$ConsumivelToJson(Consumivel instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'descricao': instance.descricao,
      'tipo': instance.tipo,
      'vida': instance.vida,
      'energia': instance.energia,
      'mana': instance.mana,
    };
