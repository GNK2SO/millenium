import 'package:flutter/material.dart';
import 'package:millenium/src/components/app_bar.dart';
import 'package:millenium/src/components/drawer.dart';
import 'package:millenium/src/models/usuario.dart';

class JogadorHomeScreen extends StatelessWidget {
  final Usuario _usuario;
  JogadorHomeScreen({@required Usuario usuario})
      : assert(usuario != null),
        _usuario = usuario;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: CustomAppBar(),
        drawer: CustomDrawer(
          usuario: this._usuario,
        ),
        body: Container(),
      ),
    );
  }
}
