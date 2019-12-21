import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:millenium/src/blocs/authentication_bloc/authentication_event.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/blocs/authentication_bloc/authentication_bloc.dart';

import 'utils/custom_divider.dart';

class CustomDrawer extends StatelessWidget {
  final Usuario _usuario;

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
              Navigator.of(context).pop();
              if (this._usuario.isAdmin) {
                Navigator.of(context).pushNamed("/todosPersonagemScreen");
              } else {
                Navigator.of(context).pushNamed("/meusPersonagensScreen");
              }
            },
          ),
          ListTile(
            title: Text("Loja"),
          ),
          ListTile(
            title: Text("Meu Perfil"),
          ),
          CustomDivider(
            color: Theme.of(context).primaryColor,
            height: 1,
            width: MediaQuery.of(context).size.width,
          ),
          ListTile(
            title: Text("Informação", style: TextStyle(color: Colors.black54),),
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
            onTap: () {
              Navigator.of(context).popAndPushNamed("/bestiarioScreen");
            },
          ),
          ListTile(
            title: Text("Regras do Jogo"),
          ),
          ListTile(
            title: Text("Sair"),
            onTap: () {
              BlocProvider.of<AuthenticationBloc>(context)
                  .add(LoggedOut());
              Navigator.of(context).pushNamedAndRemoveUntil(
                  "/loginScreen", (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
}
