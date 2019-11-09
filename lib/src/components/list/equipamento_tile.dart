import 'package:flutter/material.dart';
import 'package:millenium/src/components/utils/custom_divider.dart';
import 'package:millenium/src/models/equipamento/arma/arma.dart';
import 'package:millenium/src/models/equipamento/armadura/armadura.dart';

typedef Callback(dynamic item);

class EquipamentoTile extends StatelessWidget {
  final bool isNotAdmin;
  final List equipamentos;
  final Callback onUnequipped;
  EquipamentoTile({
    @required this.isNotAdmin,
    @required this.equipamentos,
    @required this.onUnequipped,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: equipamentos.length,
      itemBuilder: (context, index) {
        dynamic item = equipamentos[index];
        return ListTile(
          title: Text(
            item.nome,
            style: TextStyle(fontSize: 20),
          ),
          trailing: FlatButton(
            child: Text("Desequipar"),
            onPressed: () {
              onUnequipped(item);
            },
          ),
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
      case 'Arma':
        return ArmaTile(arma: item);
      case 'Armadura':
        return ArmaduraTile(armadura: item);
      default:
        return Container();
    }
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
