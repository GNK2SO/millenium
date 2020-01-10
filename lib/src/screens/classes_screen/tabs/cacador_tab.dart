import 'package:flutter/material.dart';
import 'package:millenium/src/components/detalhamento_classe/habilidades.dart';
import 'package:millenium/src/components/detalhamento_classe/titulo.dart';
import 'package:millenium/src/models/classe/classe.dart';

class CacadorTab extends StatelessWidget {
  final Classe classe;

  CacadorTab({@required this.classe});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Titulo(
              titulo: classe.nome,
              subTitulo: classe.descricao,
            ),
            Habilidades(habilidades: classe.habilidades),
            HabilidadeAprendizagem(habilidades: classe.habilidadesAprendizagem),
          ],
        ),
      ),
    );
  }
}
