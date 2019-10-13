import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:millenium/src/blocs/personagem_bloc.dart';
import 'package:millenium/src/components/app_bar.dart';
import 'package:millenium/src/models/page_state.dart';
import 'package:millenium/src/models/page_state_info.dart';
import 'package:millenium/src/models/personagem.dart';
import 'package:millenium/src/screens/personagem_screen/tabs/atributos_tab.dart';
import 'package:millenium/src/screens/personagem_screen/tabs/equipamento_tab.dart';
import 'package:millenium/src/screens/personagem_screen/tabs/habilidades_tab.dart';
import 'package:millenium/src/util/util.dart';

class PersonagemScreen extends StatefulWidget {
  final Personagem personagem;
  final PersonagemBloc bloc;

  PersonagemScreen({@required this.personagem, this.bloc});
  @override
  _PersonagemScreenState createState() =>
      _PersonagemScreenState(personagem: personagem);
}

class _PersonagemScreenState extends State<PersonagemScreen> {
  final Personagem personagem;

  _PersonagemScreenState({@required this.personagem});

  final List<String> _tabs = ["Atributos", "Habilidades", "Equipamento"];
  PersonagemBloc _bloc = BlocProvider.getBloc<PersonagemBloc>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _bloc.stateSink.add(PageStateInfo(state: PageState.SCREEN));
    _bloc.stateStream.listen((state) {
      if (state.message != null) {
        showMessage(
          key: _scaffoldKey,
          mensagem: state.message,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
              personagem: personagem,
            ),
            HabilidadesTab(),
            EquipamentoTab()
          ],
        ),
      ),
    );
  }
}
