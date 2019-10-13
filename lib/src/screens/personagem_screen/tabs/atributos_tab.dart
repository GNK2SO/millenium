import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:millenium/src/blocs/personagem_bloc.dart';
import 'package:millenium/src/components/form/animated_button.dart';
import 'package:millenium/src/components/form/atributo_form_field.dart';
import 'package:millenium/src/components/form/info_card.dart';
import 'package:millenium/src/components/form/status_card.dart';
import 'package:millenium/src/models/atributos.dart';
import 'package:millenium/src/models/page_state.dart';
import 'package:millenium/src/models/page_state_info.dart';
import 'package:millenium/src/models/personagem.dart';

class AtributosTab extends StatefulWidget {
  final Personagem personagem;
  AtributosTab({@required this.personagem});
  @override
  _AtributosTabState createState() =>
      _AtributosTabState(personagem: personagem);
}

class _AtributosTabState extends State<AtributosTab>
    with SingleTickerProviderStateMixin {
  final Personagem personagem;
  _AtributosTabState({@required this.personagem});

  final PersonagemBloc _bloc = BlocProvider.getBloc<PersonagemBloc>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CircleAvatar(
                radius: 64,
              ),
            ),
            InfoCard(personagem: personagem),
            StatusCard(personagem: personagem),
            AtributosFormField(
              atributos: personagem.atributos,
              atributosBase: Atributos.fromJson(personagem.atributos.toJson()),
              onSaved: (atributos) {
                personagem.atributos = atributos;
              },
            ),
            StreamBuilder<PageStateInfo>(
                stream: _bloc.stateStream,
                builder: (context, snapshot) {
                  return AnimatedButton(
                    controller: _animationController,
                    text: "SALVAR",
                    onPressed: () {
                      if (snapshot.hasData) {
                        _onFormSubmitted(snapshot.data.state);
                      }
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }

  void _onFormSubmitted(PageState state) {
    bool isValidForm = _formKey.currentState.validate();
    if (state != PageState.LOADING && isValidForm) {
      _bloc.atualizar(personagem);
    }
  }
}
