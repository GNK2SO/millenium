import 'package:flutter/material.dart';
import 'package:millenium/src/models/item/item.dart';

class ItemTile extends StatelessWidget {
  final Item item;

  ItemTile({this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          "Quantidade: ${item.quantidade}",
          style: TextStyle(fontSize: 12),
        ),
        Text("\n${item.descricao}"),
      ],
    );
  }
}
