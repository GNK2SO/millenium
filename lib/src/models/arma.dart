import 'package:millenium/src/models/categoria.dart';
import 'package:millenium/src/models/equipamento.dart';
import 'package:millenium/src/models/tipo_arma.dart';
import 'package:millenium/src/models/tipo_equipamento.dart';

abstract class Arma extends Equipamento {
  int dano;
  TipoArma tipoArma;
  double peso;
  Arma({
    this.dano,
    this.tipoArma,
    this.peso,
    String nome,
    Categoria categoria,
    int durabilidade,
    TipoEquipamento tipoEquipamento,
    String descricao,
    bool isBroken,
  }) : super(
          nome: nome,
          categoria: categoria,
          durabilidade: durabilidade,
          tipoEquipamento: tipoEquipamento,
          descricao: descricao,
          isBroken: isBroken,
        );
}
