import 'package:flutter/material.dart';
import 'package:millenium/src/components/animated_button.dart';
import 'package:millenium/src/components/custom_divider.dart';
import 'package:millenium/src/components/image_form_field.dart';
import 'package:millenium/src/components/info_card.dart';
import 'package:millenium/src/models/atributos.dart';
import 'package:millenium/src/models/personagem.dart';

class CadastroPersonagemScreen extends StatefulWidget {
  @override
  _CadastroPersonagemScreenState createState() =>
      _CadastroPersonagemScreenState();
}

class _CadastroPersonagemScreenState extends State<CadastroPersonagemScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  Personagem personagem = Personagem(
    atributos: Atributos(
      strenght: 0,
      dexterity: 0,
      vitality: 0,
      intelligence: 0,
    ),
  );

  int pontosDistribuicao = 5;

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Personagem"),
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refresh,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 18.0),
          child: Column(
            children: <Widget>[
              ImageFormField(
                context: context,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 20, 4, 8),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Nome",
                    labelStyle: TextStyle(fontSize: 20),
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child: ExpansionTile(
                      title: Text(
                        "Info",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomDivider(
                              height: 1,
                            ),
                            _buildInfoRow("XP", "0 / 25"),
                            CustomDivider(
                              height: 1,
                            ),
                            _buildInfoRow("Level", "1"),
                            CustomDivider(
                              height: 1,
                            ),
                            InkWell(
                              child: _buildInfoRow("Raça", "Humano"),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Container(),
                                    );
                                  },
                                );
                              },
                            ),
                            CustomDivider(
                              height: 1,
                            ),
                            _buildInfoRow("Classe", "Guerreiro"),
                            CustomDivider(
                              height: 1,
                            ),
                            _buildInfoRow("Título", "O Suicída"),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                child: Container(
                  decoration: BoxDecoration(border: Border.all()),
                  child: ExpansionTile(
                    title: Text(
                      "Atributos",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    children: <Widget>[
                      _buildBodyCardAtributo(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: AnimatedButton(
                  text: "CADASTRAR",
                  controller: _animationController.view,
                  onPressed: () {
                    _animationController.forward();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBodyCardAtributo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomDivider(
          height: 1,
        ),
        Text(
          "Pontos: ${this.pontosDistribuicao}",
          textAlign: TextAlign.center,
        ),
        CustomDivider(
          height: 1,
        ),
        _buildAtributoRow(
          text: "STR",
          pontos: personagem.atributos.strenght,
          addPonto: () {
            if (this.pontosDistribuicao > 0) {
              setState(() {
                personagem.atributos.strenght++;
                this.pontosDistribuicao--;
              });
            }
          },
          removePonto: () {
            if (personagem.atributos.strenght > 0) {
              setState(() {
                personagem.atributos.strenght--;
                this.pontosDistribuicao++;
              });
            }
          },
        ),
        CustomDivider(
          height: 1,
        ),
        _buildAtributoRow(
          text: "DEX",
          pontos: personagem.atributos.dexterity,
          addPonto: () {
            if (this.pontosDistribuicao > 0) {
              setState(() {
                personagem.atributos.dexterity++;
                this.pontosDistribuicao--;
              });
            }
          },
          removePonto: () {
            if (personagem.atributos.dexterity > 0) {
              setState(() {
                personagem.atributos.dexterity--;
                this.pontosDistribuicao++;
              });
            }
          },
        ),
        CustomDivider(
          height: 1,
        ),
        _buildAtributoRow(
          text: "VIT",
          pontos: personagem.atributos.vitality,
          addPonto: () {
            if (this.pontosDistribuicao > 0) {
              setState(() {
                personagem.atributos.vitality++;
                this.pontosDistribuicao--;
              });
            }
          },
          removePonto: () {
            if (personagem.atributos.vitality > 0) {
              setState(() {
                personagem.atributos.vitality--;
                this.pontosDistribuicao++;
              });
            }
          },
        ),
        CustomDivider(
          height: 1,
        ),
        _buildAtributoRow(
          text: "INT",
          pontos: personagem.atributos.intelligence,
          addPonto: () {
            if (this.pontosDistribuicao > 0) {
              setState(() {
                personagem.atributos.intelligence++;
                this.pontosDistribuicao--;
              });
            }
          },
          removePonto: () {
            if (personagem.atributos.intelligence > 0) {
              setState(() {
                personagem.atributos.intelligence--;
                this.pontosDistribuicao++;
              });
            }
          },
        ),
      ],
    );
  }

  Widget _buildAtributoRow({text, pontos, addPonto, removePonto}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(children: <Widget>[
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Expanded(
          child: IconButton(
            icon: Icon(Icons.remove),
            onPressed: removePonto,
          ),
        ),
        Expanded(
          child: Text(
            "${pontos}",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Expanded(
          child: IconButton(
            icon: Icon(Icons.add),
            onPressed: addPonto,
          ),
        ),
      ]),
    );
  }

  Widget _buildInfoRow(String text, String descricao) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(children: <Widget>[
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Expanded(
          child: Text(
            descricao,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ]),
    );
  }
}
