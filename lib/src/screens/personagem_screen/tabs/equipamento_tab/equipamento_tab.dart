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

  final refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

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

  Future<void> refresh() async {
    BlocProvider.of<PersonagemBloc>(context).add(
      ObterPersonagem(idPersonagem: personagem.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<PersonagemBloc, PersonagemState>(
        listener: (context, state) {
          if (state is PersonagemSuccess) {
            BlocProvider.of<PersonagemBloc>(context).add(
              ObterPersonagem(idPersonagem: personagem.id),
            );
          }
          if (state is PersonagemCarregado) {
            setState(() {
              personagem = state.personagem;
            });
          }
        },
        child: RefreshIndicator(
          key: refreshIndicatorKey,
          onRefresh: refresh,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  EquipamentoCard(personagem: personagem),
                  BolsaCard(personagem: personagem)
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: usuario.isAdmin
          ? _FloatingAdminButton(
              onSalvar: atualizarPersonagem,
              onAdicionar: exibirPopupCadastroItem,
            )
          : FloatingActionButton(
              child: Icon(Icons.save),
              onPressed: atualizarPersonagem,
            ),
    );
  }
}

class _FloatingAdminButton extends StatelessWidget {
  final Function onSalvar;
  final Function onAdicionar;

  _FloatingAdminButton({@required this.onSalvar, @required this.onAdicionar});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
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
