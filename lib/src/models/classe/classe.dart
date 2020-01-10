import 'package:json_annotation/json_annotation.dart';
import 'package:millenium/src/models/habilidade/habilidade.dart';

part 'classe.g.dart';

@JsonSerializable()
class Classe {
  String nome;
  String descricao;
  List<Habilidade> habilidades;
  List<Habilidade> habilidadesAprendizagem;

  Classe({
    this.nome,
    this.descricao,
    this.habilidades,
    this.habilidadesAprendizagem,
  });

  factory Classe.fromJson(Map<String, dynamic> json) => _$ClasseFromJson(json);

  Map<String, dynamic> toJson() => _$ClasseToJson(this);
}
