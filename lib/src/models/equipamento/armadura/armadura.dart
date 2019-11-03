import 'package:json_annotation/json_annotation.dart';
import 'package:millenium/src/models/equipamento/equipamento.dart';

part 'armadura.g.dart';

@JsonSerializable()
class Armadura extends Equipamento {
  int defesa;

  Armadura({
    this.defesa,
    String nome,
    String descricao,
    String tipo,
    String tipoEquipamento,
  }) : super(
          nome: nome,
          descricao: descricao,
          tipo: tipo,
          tipoEquipamento: tipoEquipamento,
        );

  factory Armadura.fromJson(Map<String, dynamic> json) =>
      _$ArmaduraFromJson(json);

  Map<String, dynamic> toJson() => _$ArmaduraToJson(this);
}
