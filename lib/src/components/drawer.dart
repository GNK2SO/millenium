import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:millenium/src/bloc/authentication_bloc/authentication_event.dart';
import 'package:millenium/src/models/usuario.dart';

class CustomDrawer extends StatelessWidget {
  Usuario _usuario;

  CustomDrawer({@required Usuario usuario})
      : assert(usuario != null),
        _usuario = usuario;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text(_usuario.nome),
              accountEmail: Text(_usuario.email),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(),
                onTap: () {},
              )),
          ListTile(
            title: Text("Personagens"),
            onTap: () {
              Navigator.of(context)
                  .popAndPushNamed("/personagensScreen", arguments: _usuario);
            },
          ),
          ListTile(
            title: Text("História"),
          ),
          ListTile(
            title: Text("Classes"),
            onTap: () {
              Navigator.of(context).popAndPushNamed("/classesScreen");
            },
          ),
          ListTile(
            title: Text("Bestiário"),
          ),
          ListTile(
            title: Text("Loja"),
          ),
          ListTile(
            title: Text("Minha Conta"),
          ),
          ListTile(
            title: Text("Sair"),
            onTap: () {
              deslogar(context);
            },
          ),
        ],
      ),
    );
  }

  void deslogar(BuildContext context) {
    BlocProvider.of<AuthenticationBloc>(context).dispatch(LoggedOut());
  }
}
