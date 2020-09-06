import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_bloc.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_event.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_state.dart';
import 'package:millenium/src/components/card/admin_card.dart';
import 'package:millenium/src/components/card/info_card.dart';
import 'package:millenium/src/components/card/status_card.dart';
import 'package:millenium/src/components/form/atributos/atributo_combate_form_field.dart';
import 'package:millenium/src/components/form/atributos/atributo_exploracao_form_field.dart.dart';
import 'package:millenium/src/components/form/personagem/imagem_personagem.dart';
import 'package:millenium/src/models/atributos_combate/atributos_combate.dart';
import 'package:millenium/src/models/atributos_exploracao/atributos_exploracao.dart';
import 'package:millenium/src/models/personagem/personagem.dart';
import 'package:millenium/src/models/usuario.dart';

class AtributosTab extends StatefulWidget {
  final Personagem personagem;
  final Usuario usuario;

  AtributosTab({@required this.personagem, @required this.usuario});

  @override
  _AtributosTabState createState() =>
      _AtributosTabState(usuario: usuario, personagem: personagem);
}

class _AtributosTabState extends State<AtributosTab>
    with SingleTickerProviderStateMixin {
  Usuario usuario;
  Personagem personagem;

  _AtributosTabState({
    @required this.usuario,
    @required this.personagem,
  });

  GlobalKey<FormState> _formKey;
  GlobalKey<RefreshIndicatorState> _refreshKey;
  AnimationController _animationController;

  Widget iconFloatingButton = Icon(Icons.check);

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _refreshKey = GlobalKey<RefreshIndicatorState>();
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

  void personagemListener(BuildContext context, PersonagemState state) {
    if (state is PersonagemCarregando) {
      setState(() {
        iconFloatingButton = CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.white),
        );
      });
    }

    if (state is PersonagemAtualizado) {
      setState(() {
        iconFloatingButton = Icon(Icons.check);
      });
    }
  }

  void _atualizarPersonagem() {
    _formKey.currentState.save();

    BlocProvider.of<PersonagemBloc>(context).add(
      AtualizarPersonagem(personagem: personagem),
    );
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
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  ImagemPersonagem(
                    imagem: personagem.imagem,
                    onChanged: (imagem) {
                      if (imagem is String) {
                        personagem.imagem = imagem;
                      }
                    },
                  ),
                  Visibility(
                    visible: usuario.isAdmin,
                    child: AdminCard(personagem: personagem),
                  ),
                  InfoCard(isAdmin: usuario.isAdmin, personagem: personagem),
                  StatusCard(personagem: personagem),
                  AtributosCombateFormField(
                    isAdmin: usuario.isAdmin,
                    isKarmaUnlocked: this.personagem.karma,
                    isMagiaUnlocked: this.personagem.isMagiaUnlocked(),
                    atributos: personagem.atributosCombate,
                    atributosBase: AtributosCombate.fromJson(
                      personagem.atributosCombate.toJson(),
                    ),
                  ),
                  AtributosExploracaoFormField(
                    isAdmin: usuario.isAdmin,
                    atributos: personagem.atributosExploracao,
                    atributosBase: AtributosExploracao.fromJson(
                      personagem.atributosExploracao.toJson(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: iconFloatingButton,
          onPressed: _atualizarPersonagem,
        ),
      ),
    );
  }
}
