import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_bloc.dart';
import 'package:millenium/src/blocs/classe_bloc/classe_bloc.dart';
import 'package:millenium/src/blocs/classe_bloc/classe_event.dart';
import 'package:millenium/src/blocs/classe_bloc/classe_state.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_event.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_state.dart';
import 'package:millenium/src/components/tiles/habilidade_tile.dart';
import 'package:millenium/src/components/utils/custom_divider.dart';
import 'package:millenium/src/models/habilidade/habilidade.dart';
import 'package:millenium/src/models/personagem/personagem.dart';
import 'package:millenium/src/screens/loading_screen.dart';
import 'package:millenium/src/util/util.dart';

class AddHabilidadeScreen extends StatefulWidget {
  final Personagem personagem;

  AddHabilidadeScreen({@required this.personagem});

  @override
  _AddHabilidadeScreenState createState() =>
      _AddHabilidadeScreenState(personagem: personagem);
}

class _AddHabilidadeScreenState extends State<AddHabilidadeScreen> {
  _AddHabilidadeScreenState({@required this.personagem});

  final Personagem personagem;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  int pontosHabilidade;
  List<Habilidade> habilidadesSelecionadas = [];

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    pontosHabilidade = personagem.pontosHabilidade;
    BlocProvider.of<ClasseBloc>(context)
        .add(ObterClasse(nome: personagem.classe));
  }

  List<Habilidade> getHabilidades(List<Habilidade> habilidadeClasse) {
    return habilidadeClasse.where((habilidade) {
      return !personagem.habilidades.contains(habilidade);
    }).toList();
  }

  void atualizarPersonagem() {
    BlocProvider.of<PersonagemBloc>(context).add(
      AtualizarPersonagem(personagem: personagem),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Nova Habilidade"),
        actions: [
          Visibility(
            visible: pontosHabilidade != personagem.pontosHabilidade,
            child: IconButton(
              icon: Icon(Icons.replay),
              onPressed: () {
                setState(() {
                  habilidadesSelecionadas.clear();
                  pontosHabilidade = personagem.pontosHabilidade;
                });
              },
            ),
          )
        ],
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<ClasseBloc, ClasseState>(
            listener: (context, state) {
              if (state is ClasseFailure) {
                showMessage(key: scaffoldKey, mensagem: state.erro);
              }
            },
          ),
          BlocListener<PersonagemBloc, PersonagemState>(
            listener: (context, state) {
              if (state is PersonagemSuccess) {
                setState(() {
                  isLoading = false;
                });
                Navigator.of(context).pop();
              }
              if (state is PersonagemCarregando) {
                setState(() {
                  isLoading = true;
                });
              }
              if (state is PersonagemFailure) {
                setState(() {
                  isLoading = false;
                });
                showMessage(key: scaffoldKey, mensagem: state.erro);
              }
            },
          )
        ],
        child: BlocBuilder<ClasseBloc, ClasseState>(
          builder: (context, state) {
            if (state is ClasseCarregada) {
              return SingleChildScrollView(
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        _PontosHabilidade(pontosHabilidade),
                        ListView.separated(
                          shrinkWrap: true,
                          itemCount:
                              state.classe.habilidadesAprendizagem.length,
                          itemBuilder: (context, atual) {
                            Habilidade habilidade =
                                state.classe.habilidadesAprendizagem[atual];

                            return ListTile(
                              title: Text(habilidade.titulo),
                              trailing: Checkbox(
                                value: habilidadesSelecionadas
                                    .contains(habilidade),
                                onChanged: (selected) {
                                  if (pontosHabilidade > 0 && selected) {
                                    setState(() {
                                      habilidadesSelecionadas.add(habilidade);
                                      pontosHabilidade--;
                                    });
                                  }
                                  if (!selected) {
                                    setState(() {
                                      habilidadesSelecionadas
                                          .remove(habilidade);
                                      pontosHabilidade++;
                                    });
                                  }
                                },
                              ),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: HabilidadeTile(
                                        habilidade: habilidade,
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                          separatorBuilder: (context, index) {
                            return CustomDivider(height: 1);
                          },
                        ),
                      ],
                    ),
                    _LoadingIndicator(isVisible: isLoading),
                  ],
                ),
              );
            }

            if (state is ClasseCarregando) {
              return LoadingScreen();
            }

            return Container();
          },
        ),
      ),
      floatingActionButton: Visibility(
        visible: pontosHabilidade != personagem.pontosHabilidade,
        child: FloatingActionButton(
          child: Icon(Icons.check),
          onPressed: () {
            personagem.pontosHabilidade = pontosHabilidade;
            personagem.habilidades.addAll(habilidadesSelecionadas);
            atualizarPersonagem();
          },
        ),
      ),
    );
  }
}

class _PontosHabilidade extends StatelessWidget {
  final int pontosHabilidade;

  _PontosHabilidade(this.pontosHabilidade);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.black12,
        border: Border(
          bottom: BorderSide(
            color: Colors.black26,
          ),
        ),
      ),
      child: Text(
        "$pontosHabilidade Pontos",
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  final bool isVisible;

  _LoadingIndicator({@required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Container(
        height: MediaQuery.of(context).size.height - 80,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(360),
              ),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
