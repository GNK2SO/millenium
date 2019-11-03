import 'package:json_annotation/json_annotation.dart';
import 'package:millenium/src/models/equipamento/equipamento.dart';

part 'arma.g.dart';

@JsonSerializable()
class Arma extends Equipamento {
  int dano;

  Arma({
    this.dano,
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

  factory Arma.fromJson(Map<String, dynamic> json) => _$ArmaFromJson(json);

  Map<String, dynamic> toJson() => _$ArmaToJson(this);
}
