// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'arma.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Arma _$ArmaFromJson(Map<String, dynamic> json) {
  return Arma(
    dano: json['dano'] as int,
    nome: json['nome'] as String,
    descricao: json['descricao'] as String,
    tipo: json['tipo'] as String,
    tipoEquipamento: json['tipoEquipamento'] as String,
  );
}

Map<String, dynamic> _$ArmaToJson(Arma instance) => <String, dynamic>{
      'nome': instance.nome,
      'descricao': instance.descricao,
      'tipo': instance.tipo,
      'tipoEquipamento': instance.tipoEquipamento,
      'dano': instance.dano,
    };
