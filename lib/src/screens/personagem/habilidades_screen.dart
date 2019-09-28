import 'package:flutter/material.dart';
import 'package:millenium/src/models/habilidade.dart';

class HabilidadesScreen extends StatefulWidget {
  @override
  _HabilidadesScreenState createState() => _HabilidadesScreenState();
}

class _HabilidadesScreenState extends State<HabilidadesScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  List<Habilidade> habilidades = [
    Habilidade(
      nome: "Contra-Ataque",
      custo: 4,
      tipo: "Ativa",
      descricao:
          "Após uma defesa bem-sucedida, ataque o oponente sem chances de defesa ou esquiva.",
    ),
    Habilidade(
      nome: "Tenacidade",
      custo: 0,
      tipo: "Passiva",
      descricao: "Não tem desvantagem em terrenos difíceis.",
    ),
    Habilidade(
      nome: "Reflexos",
      custo: 0,
      tipo: "Passiva",
      descricao: "Melhora a chance de esquivar de flechas.",
    ),
    Habilidade(
      nome: "Atordoamento",
      custo: 4,
      tipo: "Ativa",
      descricao: "Golpeia com o escudo, chance de atordoar 1-4D8",
    ),
    Habilidade(
      nome: "Veterano",
      custo: 0,
      tipo: "Passiva",
      descricao:
          "Vencer um combate concede o dobro de experiência, execeto em guerras ou grandes guerras.",
    ),
    Habilidade(
      nome: "Rachadura",
      custo: 4,
      tipo: "Ativa",
      descricao:
          "Armas pesadas têm chance de destruir escudos ou armaduras, chance de 1D4 a cada ataque bloqueado ou acertado.",
    ),
  ];

  List<Habilidade> exploracao = [
    Habilidade(
      nome: "Contra-Ataque",
      custo: 4,
      tipo: "Ativa",
      descricao:
          "Após uma defesa bem-sucedida, ataque o oponente sem chances de defesa ou esquiva.",
    ),
    Habilidade(
      nome: "Tenacidade",
      custo: 0,
      tipo: "Passiva",
      descricao: "Não tem desvantagem em terrenos difíceis.",
    ),
    Habilidade(
      nome: "Reflexos",
      custo: 0,
      tipo: "Passiva",
      descricao: "Melhora a chance de esquivar de flechas.",
    ),
    Habilidade(
      nome: "Atordoamento",
      custo: 4,
      tipo: "Ativa",
      descricao: "Golpeia com o escudo, chance de atordoar 1-4D8",
    ),
    Habilidade(
      nome: "Veterano",
      custo: 0,
      tipo: "Passiva",
      descricao:
          "Vencer um combate concede o dobro de experiência, execeto em guerras ou grandes guerras.",
    ),
    Habilidade(
      nome: "Rachadura",
      custo: 4,
      tipo: "Ativa",
      descricao:
          "Armas pesadas têm chance de destruir escudos ou armaduras, chance de 1D4 a cada ataque bloqueado ou acertado.",
    ),
  ];

  int _limite = 5;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
  }

  Future _refresh() {
    return Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: _refresh,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            Card(
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: ExpansionTile(
                  title: Text(
                    "Habilidades",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: habilidades.map((habilidade) {
                        return ListTile(
                          title: Text(habilidade.nome),
                          subtitle: Text(habilidade.tipo),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 4.0),
                                          child: Text(habilidade.nome,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 4.0),
                                          child: Text("${habilidade.tipo}"),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 4.0),
                                          child: Text(
                                              "Custo: ${habilidade.custo}"),
                                        ),
                                        Text(
                                          habilidade.descricao,
                                          textAlign: TextAlign.justify,
                                        )
                                      ],
                                    ),
                                  );
                                });
                          },
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: ExpansionTile(
                  title: Text(
                    "Exploração",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: exploracao.map((exploracao) {
                        return ListTile(
                          title: Text(exploracao.nome),
                          subtitle: Text(exploracao.tipo),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 4.0),
                                          child: Text(exploracao.nome,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 4.0),
                                          child: Text("${exploracao.tipo}"),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 4.0),
                                          child: Text(
                                              "Custo: ${exploracao.custo}"),
                                        ),
                                        Text(
                                          exploracao.descricao,
                                          textAlign: TextAlign.justify,
                                        )
                                      ],
                                    ),
                                  );
                                });
                          },
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
