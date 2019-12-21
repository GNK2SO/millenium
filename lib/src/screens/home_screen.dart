import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/blocs/usuario_bloc/usuario_bloc.dart';
import 'package:millenium/src/blocs/usuario_bloc/usuario_state.dart';
import 'package:millenium/src/components/app_bar.dart';
import 'package:millenium/src/components/drawer.dart';
import 'package:millenium/src/models/usuario.dart';

class HomeScreen extends StatefulWidget {
  final Usuario _usuario;
  HomeScreen({@required Usuario usuario})
      : assert(usuario != null),
        _usuario = usuario;

  @override
  _HomeScreenState createState() => _HomeScreenState(usuario: _usuario);
}

class _HomeScreenState extends State<HomeScreen> {
  Usuario usuario;
  _HomeScreenState({@required this.usuario});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UsuarioBloc, UsuarioState>(
      listener: (context, state) {
        if (state is UsuarioAtualizado) {
          setState(() {
            usuario = state.usuario;
          });
        }
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: CustomAppBar(),
          drawer: CustomDrawer(
            usuario: usuario,
          ),
          body: Container(),
          floatingActionButton: Visibility(
            visible: usuario.isAdmin,
            child: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
