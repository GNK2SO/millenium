import 'package:json_annotation/json_annotation.dart';
import 'package:millenium/src/models/equipamento/equipamento.dart';

part 'capa.g.dart';

@JsonSerializable()
class Capa extends Equipamento {
  int resistenciaFrio;

  Capa({
    this.resistenciaFrio,
    String nome,
    String descricao,
    String tipo,
  }) : super(
          nome: nome,
          descricao: descricao,
          tipo: tipo,
        );

  factory Capa.fromJson(Map<String, dynamic> json) => _$CapaFromJson(json);

  Map<String, dynamic> toJson() => _$CapaToJson(this);
}
