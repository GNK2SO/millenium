import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_bloc.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_state.dart';
import 'package:millenium/src/components/app_bar.dart';
import 'package:millenium/src/models/personagem/personagem.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/screens/personagem_screen/tabs/atributos_tab.dart';
import 'package:millenium/src/screens/personagem_screen/tabs/equipamento_tab.dart';
import 'package:millenium/src/screens/personagem_screen/tabs/habilidades_tab.dart';
import 'package:millenium/src/util/util.dart';

class PersonagemScreen extends StatefulWidget {
  final Usuario usuario;
  final Personagem personagem;

  PersonagemScreen({
    @required this.usuario,
    @required this.personagem,
  });
  @override
  _PersonagemScreenState createState() =>
      _PersonagemScreenState(personagem: personagem);
}

class _PersonagemScreenState extends State<PersonagemScreen> {
  final Personagem personagem;

  _PersonagemScreenState({@required this.personagem});

  final List<String> _tabs = ["Atributos", "Habilidades", "Equipamento"];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<PersonagemBloc, PersonagemState>(
      listener: (context, state) {
        if (state is Success) {
          if (state.mensagem.isNotEmpty) {
            showMessage(key: _scaffoldKey, mensagem: state.mensagem);
          }
        } else if (state is Failure) {
          showMessage(
            key: _scaffoldKey,
            mensagem: state.erro,
          );
        }
      },
      child: DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
          key: _scaffoldKey,
          appBar: CustomAppBar(
            personagemNome: personagem.nome,
            tabBar: TabBar(
              tabs: _tabs.map((tab) {
                return Tab(text: tab);
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              AtributosTab(
                usuario: this.widget.usuario,
                personagem: personagem,
              ),
              HabilidadesTab(),
              EquipamentoTab(
                usuario: this.widget.usuario,
                personagem: personagem,
              )
            ],
          ),
        ),
      ),
    );
  }
}
