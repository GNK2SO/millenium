import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:millenium/src/blocs/authentication_bloc.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/screens/jogador/personagens_jogador_screen.dart';
import 'package:millenium/src/screens/login_screen.dart';
import 'package:millenium/src/screens/mestre/personagens_screen.dart';
import 'package:millenium/src/util/util.dart';

class CustomDrawer extends StatelessWidget {
  final _bloc = BlocProvider.getBloc<AuthenticationBloc>();
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
                navigateTo(
                  context,
                  PersonagensScreen(
                    usuario: this._usuario,
                  ),
                );
              } else {
                navigateTo(
                  context,
                  PersonagensJogadorScreen(
                    usuario: this._usuario,
                  ),
                );
              }
            },
          ),
          ListTile(
            title: Text("Loja"),
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
            title: Text("Regras do Jogo"),
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
    _bloc.efetuarLogout();
    replaceTo(context, LoginScreen());
  }
}
