import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:millenium/src/blocs/authentication_bloc/authentication_event.dart';
import 'package:millenium/src/components/form/imagem/imagem_perfil.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:millenium/src/util/theme.dart';

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
              accountEmail: Text(_usuario.email, style: textSecondary),
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
            leading: SvgPicture.asset(
              "assets/icons/viking.svg",
              width: 24,
              semanticsLabel: 'Meu Perfil',
            ),
            title: Text("Meu Perfil"),
            onTap: () {
              Navigator.of(context).popAndPushNamed("/perfilScreen");
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/icons/scroll.svg",
              width: 24,
              semanticsLabel: 'História',
            ),
            title: Text("História"),
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/icons/class.svg",
              width: 24,
              semanticsLabel: 'Classes',
            ),
            title: Text("Classes"),
            onTap: () {
              Navigator.of(context).popAndPushNamed("/classesScreen");
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/icons/bestiario.svg",
              width: 24,
              semanticsLabel: 'Bestiário',
            ),
            title: Text("Bestiário"),
            onTap: () {
              Navigator.of(context).popAndPushNamed("/bestiarioScreen");
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/icons/rules.svg",
              width: 24,
              semanticsLabel: 'Regras do jogo',
            ),
            title: Text("Como funciona?"),
            onTap: () {
              Navigator.of(context).popAndPushNamed("/regrasScreen");
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/icons/viking-ship.svg",
              width: 24,
              semanticsLabel: 'Sair',
            ),
            title: Text("Sair"),
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  "/", (Route<dynamic> route) => false);
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
            },
          ),
        ],
      ),
    );
  }
}
