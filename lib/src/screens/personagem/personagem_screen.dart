import 'package:flutter/material.dart';
import 'package:millenium/src/components/app_bar.dart';
import 'package:millenium/src/components/drawer.dart';
import 'package:millenium/src/models/personagem.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/screens/personagem/atributos_screen.dart';
import 'package:millenium/src/screens/personagem/equipamento_screen.dart';
import 'package:millenium/src/screens/personagem/habilidades_screen.dart';

class PersonagemScreen extends StatefulWidget {
  Usuario _usuario;
  Personagem _personagem;

  PersonagemScreen({
    Usuario usuario,
    Personagem personagem,
  })  : assert(usuario != null && personagem != null),
        _usuario = usuario,
        _personagem = personagem;

  @override
  _PersonagemScreenState createState() => _PersonagemScreenState();
}

class _PersonagemScreenState extends State<PersonagemScreen> {
  Personagem _personagem;

  @override
  void initState() {
    super.initState();
    _personagem = this.widget._personagem;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar(
          tabBar: TabBar(
            tabs: <Widget>[
              Tab(
                text: "Atributos",
              ),
              Tab(
                text: "Habilidades",
              ),
              Tab(
                text: "Equipamentos",
              ),
            ],
          ),
        ),
        drawer: CustomDrawer(
          usuario: this.widget._usuario,
        ),
        body: TabBarView(
          children: <Widget>[
            AtributosScreen(
              personagem: _personagem,
            ),
            HabilidadesScreen(),
            EquipamentoScreen(),
          ],
        ),
      ),
    );
  }
}
