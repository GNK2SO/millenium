import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/blocs/bestiario_bloc/bestiario_bloc.dart';
import 'package:millenium/src/blocs/bestiario_bloc/bestiario_state.dart';
import 'package:millenium/src/components/app_bar.dart';
import 'package:millenium/src/components/list/bestiario_tile.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/screens/error_screen.dart';
import 'package:millenium/src/screens/loading_screen.dart';

class BestiarioList extends StatefulWidget {
  final Usuario usuario;
  BestiarioList({@required this.usuario});

  @override
  _BestiarioListState createState() => _BestiarioListState(usuario: usuario);
}

class _BestiarioListState extends State<BestiarioList> {
  final Usuario usuario;
  _BestiarioListState({@required this.usuario});

  @override
  Widget build(BuildContext context) {
    return BlocListener<BestiarioBloc, BestiarioState>(
      listener: (context, state) {},
      child: Scaffold(
        appBar: CustomAppBar(titulo: "Bestiário"),
        body: BlocBuilder<BestiarioBloc, BestiarioState>(
          builder: (context, state) {
            if (state is BestiarioCarregado) {
              return BestiarioTile(state.bestiario);
            } else if (state is BestiarioCarregando) {
              return LoadingScreen();
            } else if (state is BestiarioFailure) {
              return ErroScreen();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}