// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'armadura.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Armadura _$ArmaduraFromJson(Map<String, dynamic> json) {
  return Armadura(
    defesa: json['defesa'] as int,
    parte: json['parte'] as String,
    nome: json['nome'] as String,
    descricao: json['descricao'] as String,
    tipo: json['tipo'] as String,
    tipoEquipamento: json['tipoEquipamento'] as String,
  );
}

Map<String, dynamic> _$ArmaduraToJson(Armadura instance) => <String, dynamic>{
      'nome': instance.nome,
      'descricao': instance.descricao,
      'tipo': instance.tipo,
      'tipoEquipamento': instance.tipoEquipamento,
      'defesa': instance.defesa,
      'parte': instance.parte,
    };
