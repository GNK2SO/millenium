import 'package:flutter/material.dart';
import 'package:millenium/src/components/utils/custom_divider.dart';
import 'package:millenium/src/components/utils/popup_body_equipamento_tab.dart';

class EquipamentoTile extends StatelessWidget {
  final List equipamentos;
  final Function(dynamic item) onUnequipped;

  EquipamentoTile({
    @required this.equipamentos,
    @required this.onUnequipped,
  });

  @override
  Widget build(BuildContext context) {
    if (equipamentos.isEmpty) {
      return ListTile(title: Text("Não possui nenhum item equipado."));
    }
    return ListView.separated(
      shrinkWrap: true,
      itemCount: equipamentos.length,
      itemBuilder: (context, index) {
        dynamic item = equipamentos[index];
        return ListTile(
          title: Text(item.nome, style: TextStyle(fontSize: 20)),
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
                  content: PopupBody(item: item),
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
