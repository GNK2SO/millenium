// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Classe _$ClasseFromJson(Map<String, dynamic> json) {
  return Classe(
    nome: json['nome'] as String,
    descricao: json['descricao'] as String,
    habilidades: (json['habilidades'] as List)
        .map((habilidade) => Habilidade.fromJson(habilidade))
        .toList(),
    habilidadesAprendizagem: (json['habilidadesAprendizagem'] as List)
        .map((habilidade) => Habilidade.fromJson(habilidade))
        .toList(),
  );
}

Map<String, dynamic> _$ClasseToJson(Classe instance) => <String, dynamic>{
      'nome': instance.nome,
      'descricao': instance.descricao,
      'habilidades': instance.habilidades
          .map((habilidade) => habilidade.toJson())
          .toList(),
      'habilidadesAprendizagem': instance.habilidadesAprendizagem
          .map((habilidade) => habilidade.toJson())
          .toList(),
    };
