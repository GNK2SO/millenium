import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_bloc.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_event.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_state.dart';
import 'package:millenium/src/models/personagem/personagem.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/screens/personagem_screen/tabs/atributos_tab.dart';
import 'package:millenium/src/screens/personagem_screen/tabs/equipamento_tab/equipamento_tab.dart';
import 'package:millenium/src/screens/personagem_screen/tabs/habilidades_tab.dart';
import 'package:millenium/src/util/util.dart';

class PersonagemScreen extends StatefulWidget {
  final Usuario usuario;
  final Personagem personagem;
  final List<String> tabs = ["Atributos", "Habilidades", "Equipamento"];

  PersonagemScreen({
    @required this.usuario,
    @required this.personagem,
  });
  @override
  _PersonagemScreenState createState() =>
      _PersonagemScreenState(usuario: usuario, personagem: personagem);
}

class _PersonagemScreenState extends State<PersonagemScreen> {
  final Usuario usuario;
  final Personagem personagem;

  _PersonagemScreenState({
    @required this.usuario,
    @required this.personagem,
  });

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<bool> onPopScreen() async {
    if (usuario.isAdmin) {
      BlocProvider.of<PersonagemBloc>(context).add(ObterTodosPersonagens());
    } else {
      BlocProvider.of<PersonagemBloc>(context).add(
        ObterMeusPersonagens(uid: usuario.uid),
      );
    }
    return true;
  }

  void personagemListener(BuildContext context, PersonagemState state) {
    if (state is PersonagemAtualizado) {
      showMessage(
        key: _scaffoldKey,
        mensagem: state.mensagem,
      );
    }
    if (state is PersonagemFailure) {
      showMessage(
        key: _scaffoldKey,
        mensagem: state.erro,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onPopScreen,
      child: BlocListener<PersonagemBloc, PersonagemState>(
        listener: personagemListener,
        child: DefaultTabController(
          length: widget.tabs.length,
          child: Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: Text(personagem.nome),
              bottom: TabBar(
                tabs: widget.tabs.map((tabName) {
                  return Tab(text: tabName);
                }).toList(),
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                AtributosTab(
                  usuario: usuario,
                  personagem: personagem,
                ),
                HabilidadesTab(
                  usuario: usuario,
                  personagem: personagem,
                ),
                EquipamentoTab(
                  usuario: usuario,
                  personagem: personagem,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
