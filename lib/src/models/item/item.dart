import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  String nome;
  String descricao;
  String tipo;
  int quantidade;

  Item({
    this.nome,
    this.descricao,
    this.tipo,
    this.quantidade,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
