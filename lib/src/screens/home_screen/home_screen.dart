import 'package:flutter/material.dart';
import 'package:millenium/src/components/app_bar.dart';
import 'package:millenium/src/components/comunicado_tile.dart';
import 'package:millenium/src/components/custom_divider.dart';
import 'package:millenium/src/components/drawer.dart';
import 'package:millenium/src/models/comunicado.dart';
import 'package:millenium/src/models/usuario.dart';

class HomeScreen extends StatelessWidget {
  final Usuario _usuario;
  HomeScreen({@required Usuario usuario})
      : assert(usuario != null),
        _usuario = usuario;

  static final String titulo = "Lorem Ipsum Dolor Ament";
  static final String descricao =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
  static final String data = "21 Nov";

  final List<Comunicado> comunicados = [
    Comunicado(titulo: titulo, descricao: descricao, data: data),
    Comunicado(titulo: titulo, descricao: descricao, data: data),
    Comunicado(titulo: titulo, descricao: descricao, data: data),
    Comunicado(titulo: titulo, descricao: descricao, data: data),
    Comunicado(titulo: titulo, descricao: descricao, data: data),
    Comunicado(titulo: titulo, descricao: descricao, data: data),
    Comunicado(titulo: titulo, descricao: descricao, data: data),
    Comunicado(titulo: titulo, descricao: descricao, data: data),
    Comunicado(titulo: titulo, descricao: descricao, data: data),
    Comunicado(titulo: titulo, descricao: descricao, data: data),
    Comunicado(titulo: titulo, descricao: descricao, data: data),
    Comunicado(titulo: titulo, descricao: descricao, data: data),
    Comunicado(titulo: titulo, descricao: descricao, data: data),
    Comunicado(titulo: titulo, descricao: descricao, data: data),
    Comunicado(titulo: titulo, descricao: descricao, data: data),
    Comunicado(titulo: titulo, descricao: descricao, data: data),
    Comunicado(titulo: titulo, descricao: descricao, data: data),
    Comunicado(titulo: titulo, descricao: descricao, data: data),
    Comunicado(titulo: titulo, descricao: descricao, data: data),
    Comunicado(titulo: titulo, descricao: descricao, data: data),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: CustomAppBar(),
        drawer: CustomDrawer(
          usuario: this._usuario,
        ),
        body: ListView.separated(
          itemCount: comunicados.length,
          itemBuilder: (context, index) {
            return ComunicadoTile(
              comunicado: comunicados[index],
            );
          },
          separatorBuilder: (context, index) {
            return CustomDivider(
              height: 1,
            );
          },
        ),
      ),
    );
  }
}
