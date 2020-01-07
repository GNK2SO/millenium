import 'package:flutter/material.dart';
import 'package:millenium/src/components/utils/custom_divider.dart';
import 'package:millenium/src/components/utils/popup_body_equipamento_tab.dart';

class BolsaTile extends StatelessWidget {
  final List bolsa;
  final Function(dynamic) onDismissed;
  final Function(dynamic) onEquipped;
  final Function(dynamic) onUtilizar;

  BolsaTile({
    @required this.bolsa,
    @required this.onDismissed,
    @required this.onEquipped,
    @required this.onUtilizar,
  });

  void onTapAction(dynamic item) {
    if (item.tipo == 'Arma' || item.tipo == 'Armadura' || item.tipo == 'Capa') {
      onEquipped(item);
    }

    if (item.tipo == 'Consumível') {
      onUtilizar(item);
    }
  }

  void exibirPopup(BuildContext context, dynamic item) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(item.nome),
          content: PopupBody(item: item),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: bolsa.length,
      itemBuilder: (context, index) {
        dynamic item = bolsa[index];
        return Dismissible(
          key: Key(item.nome),
          background: Container(color: Colors.red),
          child: ListTile(
            title: Text(
              item.nome,
              style: TextStyle(fontSize: 20),
            ),
            trailing: ActionItemButton(
              item: item,
              onPressed: () {
                onTapAction(item);
              },
            ),
            onTap: () {
              exibirPopup(context, item);
            },
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

class ActionItemButton extends StatelessWidget {
  final dynamic item;
  final Function() onPressed;

  ActionItemButton({@required this.item, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    if (item.tipo == 'Arma' || item.tipo == 'Armadura' || item.tipo == 'Capa') {
      return FlatButton(
        child: Text("Equipar"),
        onPressed: onPressed,
      );
    }

    if (item.tipo == 'Consumível') {
      return FlatButton(
        child: Text("Utilizar"),
        onPressed: onPressed,
      );
    }

    return SizedBox(width: 0, height: 0);
  }
}
