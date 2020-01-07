import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_bloc.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_event.dart';
import 'package:millenium/src/components/tiles/bolsa_tile.dart';
import 'package:millenium/src/components/utils/custom_divider.dart';
import 'package:millenium/src/models/equipamento/arma/arma.dart';
import 'package:millenium/src/models/equipamento/armadura/armadura.dart';
import 'package:millenium/src/models/equipamento/capa/capa.dart';
import 'package:millenium/src/models/personagem/personagem.dart';

class BolsaCard extends StatefulWidget {
  final Personagem personagem;

  BolsaCard({@required this.personagem});

  @override
  _BolsaCardState createState() => _BolsaCardState(personagem: personagem);
}

class _BolsaCardState extends State<BolsaCard> {
  Personagem personagem;
  _BolsaCardState({@required this.personagem});

  void onRemove(dynamic item) {
    setState(() {
      personagem.bolsa.remove(item);
    });
  }

  void onEquipped(dynamic item) {
    dynamic _equipamento;

    // Procura se tem alguma arma equipada.
    // Caso encontre alguma arma equipada
    // ela é desequipada, retornando para bolsa.
    if (item is Arma) {
      personagem.equipamentos.forEach((equipamento) {
        if (equipamento is Arma) {
          _equipamento = equipamento;
          personagem.bolsa.insert(0, equipamento);
        }
      });
    }

    // Procura se aquela parte da armadura está equipada.
    // Caso encontre aquela parte armadura equipada
    // ela é desequipada, retornando para bolsa.
    if (item is Armadura) {
      personagem.equipamentos.forEach((equipamento) {
        if (equipamento is Armadura && equipamento.parte == item.parte) {
          _equipamento = equipamento;
          personagem.bolsa.insert(0, equipamento);
        }
      });
    }

    if (item is Capa) {
      personagem.equipamentos.forEach((equipamento) {
        if (equipamento is Capa) {
          _equipamento = equipamento;
          personagem.bolsa.insert(0, equipamento);
        }
      });
    }

    setState(() {
      personagem.equipamentos.remove(_equipamento);
      personagem.bolsa.remove(item);
      personagem.equipamentos.insert(0, item);
    });
  }

  void onUtilizar(dynamic item) {
    if (personagem.vidaTotal() < personagem.vida + item.vida) {
      personagem.vida = personagem.vidaTotal();
    } else {
      personagem.vida += item.vida;
    }

    if (personagem.energiaTotal() < personagem.energia + item.energia) {
      personagem.energia = personagem.energiaTotal();
    } else {
      personagem.energia += item.energia;
    }

    if (personagem.manaTotal() < personagem.mana + item.mana) {
      personagem.mana = personagem.manaTotal();
    } else {
      personagem.mana += item.mana;
    }

    BlocProvider.of<PersonagemBloc>(context).add(
      AtualizarPersonagem(personagem: personagem),
    );

    setState(() {
      personagem.bolsa.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(border: Border.all()),
        child: ExpansionTile(
          title: Text("Mochila", style: TextStyle(fontSize: 24)),
          children: <Widget>[
            CustomDivider(height: 1, width: double.infinity),
            BolsaTile(
              bolsa: personagem.bolsa,
              onDismissed: onRemove,
              onEquipped: onEquipped,
              onUtilizar: onUtilizar,
            ),
          ],
        ),
      ),
    );
  }
}
