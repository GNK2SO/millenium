import 'package:millenium/src/models/categoria.dart';
import 'package:millenium/src/models/tipo_equipamento.dart';

abstract class Equipamento {
  String nome;
  Categoria categoria;
  int durabilidade;
  TipoEquipamento tipoEquipamento;
  String descricao;
  bool isBroken;

  Equipamento({
    this.nome,
    this.categoria,
    this.durabilidade,
    this.tipoEquipamento,
    this.descricao,
    this.isBroken,
  });
}
