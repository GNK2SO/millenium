import 'package:flutter/material.dart';
import 'package:millenium/src/components/custom_divider.dart';
import 'package:millenium/src/models/atributos.dart';

class AtributosCard extends StatefulWidget {
  bool isMutable;
  int pontosDistribuicao;
  Atributos atributos;

  AtributosCard({
    this.isMutable: false,
    this.pontosDistribuicao,
    this.atributos,
  });

  @override
  _AtributosCardState createState() => _AtributosCardState();
}

class _AtributosCardState extends State<AtributosCard> {
  int _strenght;
  int _dexterity;
  int _vitality;
  int _intelligence;

  @override
  void initState() {
    super.initState();
    _strenght = widget.atributos.strenght;
    _dexterity = widget.atributos.dexterity;
    _vitality = widget.atributos.vitality;
    _intelligence = widget.atributos.intelligence;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
            _cardBody(),
          ],
        ),
      ),
    );
  }

  Widget _cardBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomDivider(
          height: 1,
        ),
        Text(
          "Pontos: ${this.widget.pontosDistribuicao}",
          textAlign: TextAlign.center,
        ),
        CustomDivider(
          height: 1,
        ),
        _buildRow(
          text: "STR",
          pontos: _strenght,
          addPonto: this.widget.isMutable
              ? () {
                  if (this.widget.pontosDistribuicao > 0) {
                    setState(() {
                      _strenght++;
                      this.widget.pontosDistribuicao--;
                    });
                  }
                }
              : null,
          removePonto: this.widget.isMutable
              ? () {
                  if (_strenght > this.widget.atributos.strenght) {
                    setState(() {
                      _strenght--;
                      this.widget.pontosDistribuicao++;
                    });
                  }
                }
              : null,
        ),
        CustomDivider(
          height: 1,
        ),
        _buildRow(
          text: "DEX",
          pontos: _dexterity,
          addPonto: this.widget.isMutable
              ? () {
                  if (this.widget.pontosDistribuicao > 0) {
                    setState(() {
                      _dexterity++;
                      this.widget.pontosDistribuicao--;
                    });
                  }
                }
              : null,
          removePonto: this.widget.isMutable
              ? () {
                  if (_dexterity > this.widget.atributos.dexterity) {
                    setState(() {
                      _dexterity--;
                      this.widget.pontosDistribuicao++;
                    });
                  }
                }
              : null,
        ),
        CustomDivider(
          height: 1,
        ),
        _buildRow(
          text: "VIT",
          pontos: _vitality,
          addPonto: this.widget.isMutable
              ? () {
                  if (this.widget.pontosDistribuicao > 0) {
                    setState(() {
                      _vitality++;
                      this.widget.pontosDistribuicao--;
                      print(this.widget.pontosDistribuicao);
                    });
                  }
                }
              : null,
          removePonto: this.widget.isMutable
              ? () {
                  if (_vitality > this.widget.atributos.vitality) {
                    setState(() {
                      _vitality--;
                      this.widget.pontosDistribuicao++;
                    });
                  }
                }
              : null,
        ),
        CustomDivider(
          height: 1,
        ),
        _buildRow(
          text: "INT",
          pontos: _intelligence,
          addPonto: this.widget.isMutable
              ? () {
                  if (this.widget.pontosDistribuicao > 0) {
                    setState(() {
                      _intelligence++;
                      this.widget.pontosDistribuicao--;
                      print(this.widget.pontosDistribuicao);
                    });
                  }
                }
              : null,
          removePonto: this.widget.isMutable
              ? () {
                  if (_intelligence > this.widget.atributos.intelligence) {
                    setState(() {
                      _intelligence--;
                      this.widget.pontosDistribuicao++;
                    });
                  }
                }
              : null,
        ),
      ],
    );
  }

  Widget _buildRow({text, pontos, addPonto, removePonto}) {
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
}
