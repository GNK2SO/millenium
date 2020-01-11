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
import 'package:millenium/src/components/form/imagem/image_form_field.dart';
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
  _AtributosTabState({@required this.usuario, @required this.personagem});

  final _formKey = GlobalKey<FormState>();
  final _refreshKey = GlobalKey<RefreshIndicatorState>();
  AnimationController _animationController;

  Widget iconFloatingButton = Icon(Icons.check);

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
    return BlocListener<PersonagemBloc, PersonagemState>(
      listener: (context, state) {
        if (state is PersonagemCarregando) {
          setState(() {
            iconFloatingButton = CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            );
          });
        }
        if (state is PersonagemCarregado) {
          setState(() {
            iconFloatingButton = Icon(Icons.check);
          });
        }

        if (state is PersonagemSuccess) {
          setState(() {
            iconFloatingButton = Icon(Icons.check);
          });
        }
      },
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
                  _ImagemPersonagem(
                    imagem: personagem.imagem,
                    onChanged: (imagem) {
                      if (imagem is String) {
                        personagem.imagem = imagem;
                      }
                    },
                  ),
                  AdminCard(isAdmin: usuario.isAdmin, personagem: personagem),
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

  void _atualizarPersonagem() {
    _formKey.currentState.save();

    BlocProvider.of<PersonagemBloc>(context).add(
      AtualizarPersonagem(personagem: personagem),
    );
  }
}

class _ImagemPersonagem extends StatelessWidget {
  final String imagem;
  final Function(dynamic) onChanged;

  _ImagemPersonagem({@required this.imagem, @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ImageFormField(
          context: context,
          imagem: imagem,
          size: 64,
          icon: Icon(Icons.person, size: 80),
          onChanged: onChanged),
    );
  }
}
