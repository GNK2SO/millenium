import 'package:flutter/material.dart';
import 'package:millenium/src/components/utils/custom_divider.dart';
import 'package:millenium/src/models/besta/besta.dart';
import 'package:millenium/src/screens/besta/besta_screen.dart';
import 'package:millenium/src/screens/empty_screen.dart';
import 'package:millenium/src/util/util.dart';

class BestiarioTile extends StatelessWidget {
  final List<Besta> bestiario;

  BestiarioTile(this.bestiario);

  @override
  Widget build(BuildContext context) {
    if (bestiario.isEmpty) {
      return EmptyScreen(mensagem: 'Nehuma besta encontrada!');
    }
    return ListView.separated(
      itemCount: bestiario.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            bestiario[index].nome,
            style: TextStyle(fontSize: 24),
          ),
          onTap: () {
            navigateTo(context, BestaScreen(bestiario[index]));
          },
        );
      },
      separatorBuilder: (context, index) {
        return CustomDivider(height: 1);
      },
    );
  }
}
