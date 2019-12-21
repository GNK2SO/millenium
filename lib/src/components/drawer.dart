import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:millenium/src/blocs/authentication_bloc/authentication_event.dart';
import 'package:millenium/src/components/form/imagem_perfil.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/blocs/authentication_bloc/authentication_bloc.dart';

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
                child: ImagemPerfil(
                  imagem: _usuario.foto,
                  icon: Icon(
                    Icons.person,
                    size: 56,
                    color: Theme.of(context).primaryColor,
                  ),
                  backgroundColor: Colors.white,
                ),
                onTap: () {},
              )),
          ListTile(
            leading: SvgPicture.asset("assets/icons/personagens.svg",
                width: 24, semanticsLabel: 'Personagens'),
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
            leading: SvgPicture.asset("assets/icons/beer.svg",
                width: 24, semanticsLabel: 'Loja'),
            title: Text("Loja"),
          ),
          ListTile(
            leading: SvgPicture.asset("assets/icons/viking.svg",
                width: 24, semanticsLabel: 'Meu Perfil'),
            title: Text("Meu Perfil"),
            onTap: () {
              Navigator.of(context).popAndPushNamed("/perfilScreen");
            },
          ),
          ListTile(
            leading: SvgPicture.asset("assets/icons/scroll.svg",
                width: 24, semanticsLabel: 'História'),
            title: Text("História"),
          ),
          ListTile(
            leading: SvgPicture.asset("assets/icons/class.svg",
                width: 24, semanticsLabel: 'Classes'),
            title: Text("Classes"),
            onTap: () {
              Navigator.of(context).popAndPushNamed("/classesScreen");
            },
          ),
          ListTile(
            leading: SvgPicture.asset("assets/icons/bestiario.svg",
                width: 24, semanticsLabel: 'Bestiário'),
            title: Text("Bestiário"),
            onTap: () {
              Navigator.of(context).popAndPushNamed("/bestiarioScreen");
            },
          ),
          ListTile(
            leading: SvgPicture.asset("assets/icons/rules.svg",
                width: 24, semanticsLabel: 'Regras do jogo'),
            title: Text("Regras do Jogo"),
          ),
          ListTile(
            leading: SvgPicture.asset("assets/icons/viking-ship.svg",
                width: 24, semanticsLabel: 'Sair'),
            title: Text("Sair"),
            onTap: () {
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
              Navigator.of(context).pushNamedAndRemoveUntil(
                  "/loginScreen", (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
}
