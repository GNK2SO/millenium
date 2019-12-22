import 'package:json_annotation/json_annotation.dart';

part 'habilidade.g.dart';

@JsonSerializable()
class Habilidade {
  String titulo;
  String tipo;
  int custo;
  String descricao;

  Habilidade({this.titulo, this.tipo, this.custo, this.descricao});

  factory Habilidade.fromJson(Map<String, dynamic> json) =>
      _$HabilidadeFromJson(json);

  Map<String, dynamic> toJson() => _$HabilidadeToJson(this);
}
