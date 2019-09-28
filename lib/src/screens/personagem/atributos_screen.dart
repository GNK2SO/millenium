import 'package:flutter/material.dart';
import 'package:millenium/src/components/animated_button.dart';
import 'package:millenium/src/components/atributo_card.dart';
import 'package:millenium/src/components/image_form_field.dart';
import 'package:millenium/src/components/info_card.dart';
import 'package:millenium/src/components/status_card.dart';
import 'package:millenium/src/models/personagem.dart';

class AtributosScreen extends StatefulWidget {
  final Personagem _personagem;
  AtributosScreen({Personagem personagem})
      : assert(personagem != null),
        _personagem = personagem;

  @override
  _AtributosScreenState createState() => _AtributosScreenState();
}

class _AtributosScreenState extends State<AtributosScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  Personagem personagem;

  int _pontosDistribuicao = 5;

  @override
  void initState() {
    super.initState();
    personagem = this.widget._personagem;
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
            ImageFormField(
              context: context,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "Zaikay Sevensky",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            InfoCard(),
            StatusCard(),
            AtributoCard(
              update: false,
              pontosDistribuicao: _pontosDistribuicao,
              atributos: personagem.atributos,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: AnimatedButton(
                text: "SALVAR",
                controller: _animationController.view,
                onPressed: _pontosDistribuicao > 0
                    ? () {
                        _animationController.forward();
                      }
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
