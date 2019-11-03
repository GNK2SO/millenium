import 'package:json_annotation/json_annotation.dart';

part 'consumivel.g.dart';

@JsonSerializable()
class Consumivel {
  String nome;
  String descricao;
  String tipo;
  int vida;
  int energia;
  int mana;

  Consumivel({
    this.nome,
    this.descricao,
    this.tipo,
    this.vida,
    this.energia,
    this.mana,
  });

  factory Consumivel.fromJson(Map<String, dynamic> json) =>
      _$ConsumivelFromJson(json);

  Map<String, dynamic> toJson() => _$ConsumivelToJson(this);
}
