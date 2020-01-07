import 'package:flutter/material.dart';
import 'package:millenium/src/components/tiles/arma_tile.dart';
import 'package:millenium/src/components/tiles/armadura_tile.dart';
import 'package:millenium/src/components/tiles/capa_tile.dart';
import 'package:millenium/src/components/tiles/consumivel_tile.dart';
import 'package:millenium/src/components/tiles/item_tile.dart';

class PopupBody extends StatelessWidget {
  final dynamic item;

  PopupBody({this.item});

  @override
  Widget build(BuildContext context) {
    switch (item.tipo) {
      case 'Item':
        return ItemTile(item: item);
      case 'Arma':
        return ArmaTile(arma: item);
      case 'Armadura':
        return ArmaduraTile(armadura: item);
      case 'Capa':
        return CapaTile(capa: item);
      case 'Consumível':
        return ConsumivelTile(consumivel: item);
      default:
        return Container();
    }
  }
}
