// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'capa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Capa _$CapaFromJson(Map<String, dynamic> json) {
  return Capa(
    resistenciaFrio: json['resistenciaFrio'] as int,
    nome: json['nome'] as String,
    descricao: json['descricao'] as String,
    tipo: json['tipo'] as String,
  );
}

Map<String, dynamic> _$CapaToJson(Capa instance) => <String, dynamic>{
      'nome': instance.nome,
      'descricao': instance.descricao,
      'resistenciaFrio': instance.resistenciaFrio,
      'tipo': instance.tipo,
    };
