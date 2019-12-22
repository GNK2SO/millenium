part of 'habilidade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Habilidade _$HabilidadeFromJson(Map<String, dynamic> json) {
  return Habilidade(
    titulo: json['titulo'] as String,
    tipo: json['tipo'] as String,
    custo: json['custo'] as int,
    descricao: json['descricao'] as String,
  );
}

Map<String, dynamic> _$HabilidadeToJson(Habilidade instance) =>
    <String, dynamic>{
      'titulo': instance.titulo,
      'tipo': instance.tipo,
      'custo': instance.custo,
      'descricao': instance.descricao,
    };
