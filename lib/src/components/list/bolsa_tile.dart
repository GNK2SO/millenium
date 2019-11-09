import 'package:flutter/material.dart';
import 'package:millenium/src/components/utils/custom_divider.dart';
import 'package:millenium/src/models/consumivel/consumivel.dart';
import 'package:millenium/src/models/equipamento/arma/arma.dart';
import 'package:millenium/src/models/equipamento/armadura/armadura.dart';
import 'package:millenium/src/models/item/item.dart';

typedef Callback(dynamic item);

class BolsaTile extends StatelessWidget {
  final bool isNotAdmin;
  final List bolsa;
  final Callback onDismissed;
  final Callback onEquipped;
  final Callback onUtilizar;
  BolsaTile({
    @required this.isNotAdmin,
    @required this.bolsa,
    @required this.onDismissed,
    @required this.onEquipped,
    @required this.onUtilizar,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: bolsa.length,
      itemBuilder: (context, index) {
        dynamic item = bolsa[index];
        return Dismissible(
          key: Key(item.nome),
          child: ListTile(
            title: Text(
              item.nome,
              style: TextStyle(fontSize: 20),
            ),
            trailing:
                (item.tipo == "Arma" || item.tipo == "Armadura") && isNotAdmin
                    ? FlatButton(
                        child: Text("Equipar"),
                        onPressed: () {
                          onEquipped(item);
                        },
                      )
                    : item.tipo == "Consumível" && isNotAdmin
                        ? FlatButton(
                            child: Text("Utilizar"),
                            onPressed: () {
                              onUtilizar(item);
                            },
                          )
                        : null,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(item.nome),
                    content: Content(item: item),
                  );
                },
              );
            },
          ),
          background: Container(
            color: Colors.red,
          ),
          onDismissed: (_) {
            onDismissed(item);
          },
        );
      },
      separatorBuilder: (context, index) {
        return CustomDivider(height: 1);
      },
    );
  }
}

class Content extends StatelessWidget {
  final dynamic item;
  Content({this.item});

  @override
  Widget build(BuildContext context) {
    switch (item.tipo) {
      case 'Item':
        return ItemTile(item: item);
      case 'Arma':
        return ArmaTile(arma: item);
      case 'Armadura':
        return ArmaduraTile(armadura: item);
      case 'Consumível':
        return ConsumivelTile(consumivel: item);
      default:
        return Container();
    }
  }
}

class ItemTile extends StatelessWidget {
  final Item item;
  ItemTile({this.item});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text("\n${item.descricao}"),
      ],
    );
  }
}

class ArmaTile extends StatelessWidget {
  final Arma arma;
  ArmaTile({this.arma});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Dano: ${arma.dano}"),
        Text("Tipo: ${arma.tipoEquipamento}"),
        Text("\n${arma.descricao}"),
      ],
    );
  }
}

class ArmaduraTile extends StatelessWidget {
  final Armadura armadura;
  ArmaduraTile({this.armadura});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Defesa: ${armadura.defesa}"),
        Text("Tipo: ${armadura.tipoEquipamento}"),
        Text("Parte: ${armadura.parte}"),
        Text("\n${armadura.descricao}"),
      ],
    );
  }
}

class ConsumivelTile extends StatelessWidget {
  final Consumivel consumivel;
  ConsumivelTile({this.consumivel});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        consumivel.vida != 0 ? Text("Vida: ${consumivel.vida}") : Container(),
        consumivel.energia != 0
            ? Text("Vida: ${consumivel.energia}")
            : Container(),
        consumivel.mana != 0 ? Text("Vida: ${consumivel.mana}") : Container(),
        Text("\n${consumivel.descricao}"),
      ],
    );
  }
}
