import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_event.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_state.dart';
import 'package:millenium/src/components/card/bolsa_card.dart';
import 'package:millenium/src/components/card/equipamento_card.dart';
import 'package:millenium/src/models/personagem/personagem.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_bloc.dart';
import 'package:millenium/src/screens/personagem_screen/tabs/equipamento_tab/form_cadastro_item.dart';

class EquipamentoTab extends StatefulWidget {
  final Usuario usuario;
  final Personagem personagem;

  EquipamentoTab({@required this.usuario, @required this.personagem});

  @override
  _EquipamentoTabState createState() =>
      _EquipamentoTabState(usuario: usuario, personagem: personagem);
}

class _EquipamentoTabState extends State<EquipamentoTab> {
  final Usuario usuario;
  Personagem personagem;

  _EquipamentoTabState({@required this.usuario, @required this.personagem});

  AnimatedIconData iconFloatingButtonAdmin = AnimatedIcons.menu_close;
  Widget iconFloatingButtonPlayer = Icon(Icons.check);

  final _refreshKey = GlobalKey<RefreshIndicatorState>();

  void atualizarPersonagem() {
    BlocProvider.of<PersonagemBloc>(context).add(
      AtualizarPersonagem(personagem: this.personagem),
    );
  }

  void exibirPopupCadastroItem() {
    showDialog(
      context: context,
      builder: (contextMessage) {
        return FormCadastroItem(
          personagem: personagem,
          onSaved: (personagem) {
            atualizarPersonagem();
          },
        );
      },
    );
  }

  void personagemListener(BuildContext context, PersonagemState state) {
    if (state is PersonagemCarregando) {
      setState(() {
        iconFloatingButtonAdmin = null;
        iconFloatingButtonPlayer = CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.white),
        );
      });
    }
    if (state is PersonagemAtualizado) {
      setState(() {
        iconFloatingButtonAdmin = AnimatedIcons.menu_close;
        iconFloatingButtonPlayer = Icon(Icons.check);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PersonagemBloc, PersonagemState>(
      listener: personagemListener,
      child: Scaffold(
        body: RefreshIndicator(
          key: _refreshKey,
          onRefresh: () async {
            BlocProvider.of<PersonagemBloc>(context).add(
              ObterPersonagem(idPersonagem: personagem.id),
            );
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 48),
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  EquipamentoCard(personagem: personagem),
                  BolsaCard(personagem: personagem)
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: usuario.isAdmin
            ? _FloatingAdminButton(
                animatedIcon: iconFloatingButtonAdmin,
                onSalvar: atualizarPersonagem,
                onAdicionar: exibirPopupCadastroItem,
              )
            : FloatingActionButton(
                child: iconFloatingButtonPlayer,
                onPressed: atualizarPersonagem,
              ),
      ),
    );
  }
}

class _FloatingAdminButton extends StatelessWidget {
  final AnimatedIconData animatedIcon;
  final Function onSalvar;
  final Function onAdicionar;

  _FloatingAdminButton({
    @required this.animatedIcon,
    @required this.onSalvar,
    @required this.onAdicionar,
  });

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.white),
      ),
      animatedIcon: animatedIcon,
      animatedIconTheme: IconThemeData(size: 22.0),
      closeManually: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      tooltip: 'Speed Dial',
      foregroundColor: Colors.white,
      children: [
        SpeedDialChild(
          child: Icon(Icons.add),
          backgroundColor: Colors.white,
          foregroundColor: Theme.of(context).primaryColor,
          label: 'Adicionar',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: onAdicionar,
        ),
        SpeedDialChild(
          child: Icon(Icons.check),
          backgroundColor: Colors.white,
          foregroundColor: Theme.of(context).primaryColor,
          label: 'Salvar',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: onSalvar,
        ),
      ],
    );
  }
}
