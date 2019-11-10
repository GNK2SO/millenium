import 'package:json_annotation/json_annotation.dart';

part 'besta.g.dart';

@JsonSerializable()
class Besta {
  String id;
  String imagem;
  String nome;
  int nivel;
  List<String> localizacao;
  String descricao;

  Besta({
    this.id,
    this.imagem,
    this.nome,
    this.nivel,
    this.localizacao,
    this.descricao,
  });

  factory Besta.fromJson(Map<String, dynamic> json) => _$BestaFromJson(json);

  Map<String, dynamic> toJson() => _$BestaToJson(this);
}
