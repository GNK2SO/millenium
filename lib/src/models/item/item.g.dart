// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
    nome: json['nome'] as String,
    descricao: json['descricao'] as String,
    tipo: json['tipo'] as String,
  );
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'nome': instance.nome,
      'descricao': instance.descricao,
      'tipo': instance.tipo,
    };
