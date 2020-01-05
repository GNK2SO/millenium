// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'besta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Besta _$BestaFromJson(Map<String, dynamic> json) {
  return Besta(
    id: json['id'] as String,
    imagem: json['imagem'] as String,
    nome: json['nome'] as String,
    nivel: json['nivel'] as int,
    classificacao: json['classificacao'] as String,
    localizacao:
        (json['localizacao'] as List)?.map((e) => e as String)?.toList(),
    descricao: json['descricao'] as String,
  );
}

Map<String, dynamic> _$BestaToJson(Besta instance) => <String, dynamic>{
      'id': instance.id,
      'imagem': instance.imagem,
      'nome': instance.nome,
      'nivel': instance.nivel,
      'classificacao': instance.classificacao,
      'localizacao': instance.localizacao,
      'descricao': instance.descricao,
    };
