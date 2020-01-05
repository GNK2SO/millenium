import 'package:flutter/material.dart';
import 'package:millenium/src/util/theme.dart';

class EmptyScreen extends StatelessWidget {
  final String mensagem;

  EmptyScreen({@required this.mensagem});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        mensagem,
        style: TextStyle(
          fontSize: 24,
          color: primaryColor.withOpacity(0.5),
        ),
      ),
    );
  }
}
