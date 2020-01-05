import 'package:flutter/material.dart';
import 'package:millenium/src/components/app_bar.dart';
import 'package:millenium/src/models/besta/besta.dart';

class BestaScreen extends StatelessWidget {
  final Besta besta;

  BestaScreen(this.besta);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titulo: "Detalhe"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _Nome(besta.nome),
            _Nivel(besta.nivel),
            _Classificacao(besta.classificacao),
            _Localizacao(besta.localizacao),
            _Descricao(besta.descricao),
          ],
        ),
      ),
    );
  }
}

class _Nome extends StatelessWidget {
  final String nome;

  _Nome(this.nome);

  @override
  Widget build(BuildContext context) {
    return Text(
      nome,
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _Nivel extends StatelessWidget {
  final int nivel;

  _Nivel(this.nivel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        children: List.generate(nivel, (_) => Icon(Icons.star)),
      ),
    );
  }
}

class _Classificacao extends StatelessWidget {
  final String classificacao;

  _Classificacao(this.classificacao);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: "Classificação: ",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            TextSpan(
              text: classificacao,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Localizacao extends StatelessWidget {
  final List<String> localizacao;

  _Localizacao(this.localizacao);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: "Localização: ",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            TextSpan(
              text: localizacao.join(", "),
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Descricao extends StatelessWidget {
  final String descricao;

  _Descricao(this.descricao);
  @override
  Widget build(BuildContext context) {
    return Text(
      descricao,
      textAlign: TextAlign.justify,
      style: TextStyle(fontSize: 20),
    );
  }
}
