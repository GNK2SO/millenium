import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_bloc.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_event.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_state.dart';
import 'package:millenium/src/components/form/atributo_combate_form_field.dart';
import 'package:millenium/src/components/form/atributo_exploracao_form_field.dart.dart';
import 'package:millenium/src/components/form/image_form_field.dart';
import 'package:millenium/src/components/form/info_card.dart';
import 'package:millenium/src/components/form/ponto_distribuicao_form_field.dart';
import 'package:millenium/src/components/form/status_card.dart';
import 'package:millenium/src/components/utils/custom_divider.dart';
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
      _AtributosTabState(personagem: personagem);
}

class _AtributosTabState extends State<AtributosTab>
    with SingleTickerProviderStateMixin {
  Personagem personagem;
  _AtributosTabState({@required this.personagem});

  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
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
    return BlocListener<PersonagemBloc, PersonagemState>(
      listener: (context, state) {
        if (state is PersonagemCarregado) {
          setState(() {
            personagem = state.personagem;
          });
        }
      },
      child: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refresh,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 48),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ImageFormField(
                        context: context,
                        imagem: personagem.imagem,
                        size: 64,
                        icon: Icon(Icons.person, size: 80),
                        onChanged: (imagem) {
                          if (imagem is String) {
                            personagem.imagem = imagem;
                          }
                        },
                      ),
                    ),
                    Visibility(
                      visible: this.widget.usuario.isAdmin,
                      child: Card(
                        child: Container(
                          decoration: BoxDecoration(border: Border.all()),
                          child: ExpansionTile(
                            title: Text(
                              "Pontos de distribuição",
                              style: TextStyle(fontSize: 24),
                            ),
                            children: <Widget>[
                              CustomDivider(
                                height: 1,
                                width: double.infinity,
                              ),
                              PontosDitribuicaoFormField(
                                text: "Combate",
                                pontosDistribuicao: personagem
                                    .atributosCombate.pontosDistribuicao,
                                onSaved: (pontosDistribuicao) {
                                  if (pontosDistribuicao != null) {
                                    personagem.atributosCombate
                                            .pontosDistribuicao =
                                        pontosDistribuicao;
                                  }
                                },
                              ),
                              CustomDivider(
                                height: 1,
                                width: double.infinity,
                              ),
                              PontosDitribuicaoFormField(
                                text: "Exploração",
                                pontosDistribuicao: personagem
                                    .atributosExploracao.pontosDistribuicao,
                                onSaved: (pontosDistribuicao) {
                                  if (pontosDistribuicao != null) {
                                    personagem.atributosExploracao
                                            .pontosDistribuicao =
                                        pontosDistribuicao;
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InfoCard(personagem: personagem),
                    StatusCard(personagem: personagem),
                    AtributosCombateFormField(
                      isAdmin: this.widget.usuario.isAdmin,
                      atributos: personagem.atributosCombate,
                      atributosBase: AtributosCombate.fromJson(
                          personagem.atributosCombate.toJson()),
                    ),
                    AtributosExploracaoFormField(
                      isAdmin: this.widget.usuario.isAdmin,
                      atributos: personagem.atributosExploracao,
                      atributosBase: AtributosExploracao.fromJson(
                        personagem.atributosExploracao.toJson(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FloatingActionButton(
                  child: Icon(Icons.save),
                  onPressed: () {
                    _onFormSubmitted();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onFormSubmitted() {
    _formKey.currentState.save();
    BlocProvider.of<PersonagemBloc>(context)
        .add(AtualizarPersonagem(personagem: personagem));
    setState(() {});
  }

  Future<void> _refresh() async {
    BlocProvider.of<PersonagemBloc>(context)
        .add(ObterPersonagem(idPersonagem: personagem.id));
  }
}
