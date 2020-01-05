import 'package:millenium/src/models/besta/besta.dart';
import 'package:millenium/src/models/enum_flag_filtro_nivel.dart';

class FiltroBestiario {
  FlagFiltroNivel flag;
  int nivel;
  String classificacao;
  List<String> localizacoes;

  FiltroBestiario({
    this.flag,
    this.nivel,
    this.classificacao,
    this.localizacoes,
  });

  List<Besta> filtrar(List<Besta> bestiario) {
    return bestiario.where((besta) {
      return besta.classificacao == classificacao &&
          compararNivel(besta.nivel) &&
          compararLocalizacao(besta.localizacao);
    }).toList();
  }

  bool compararNivel(int nivelBesta) {
    bool resultado = false;

    switch (flag) {
      case FlagFiltroNivel.EqualTo:
        if (nivelBesta == nivel) {
          resultado = true;
        }
        break;
      case FlagFiltroNivel.GreaterThan:
        if (nivelBesta > nivel) {
          resultado = true;
        }
        break;
      case FlagFiltroNivel.LessThan:
        if (nivelBesta < nivel) {
          resultado = true;
        }
        break;
    }

    return resultado;
  }

  bool compararLocalizacao(List<String> localizacoesBesta) {
    bool resultado = true;

    if (localizacoes.isEmpty) {
      return resultado;
    }

    localizacoes.forEach((localizacao) {
      if (!localizacoesBesta.contains(localizacao)) {
        resultado = false;
      }
    });

    return resultado;
  }

  @override
  String toString() {
    return "FiltroBestiario { nivel: $nivel, flag: $flag, classificacao: $classificacao, localizacoes: $localizacoes }";
  }
}
