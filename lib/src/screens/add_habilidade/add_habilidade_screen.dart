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

import '../../blocs/personagem_bloc/personagem_state.dart';

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

  @override
  void initState() {
    super.initState();
    pontosHabilidade = personagem.pontosHabilidade;
    BlocProvider.of<ClasseBloc>(context).add(
      ObterClasse(nome: personagem.classe),
    );
  }

  void atualizarPersonagem() {
    BlocProvider.of<PersonagemBloc>(context).add(
      AtualizarPersonagem(personagem: personagem),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
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
            if (state is PersonagemAtualizado) {
              BlocProvider.of<PersonagemBloc>(context).add(
                ObterPersonagem(idPersonagem: personagem.id),
              );
              Navigator.of(context).pop();
            }
            if (state is PersonagemFailure) {
              showMessage(key: scaffoldKey, mensagem: state.erro);
            }
          },
        )
      ],
      child: Scaffold(
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
            ),
            Visibility(
              visible: pontosHabilidade != personagem.pontosHabilidade,
              child: IconButton(
                icon: Icon(Icons.check),
                onPressed: () {
                  personagem.pontosHabilidade = pontosHabilidade;
                  personagem.habilidades.addAll(habilidadesSelecionadas);
                  atualizarPersonagem();
                },
              ),
            ),
          ],
        ),
        body: BlocBuilder<ClasseBloc, ClasseState>(
          builder: (context, state) {
            if (state is ClasseCarregada) {
              List<Habilidade> habilidades =
                  state.classe.habilidadesAprendizagem;

              return Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      _PontosHabilidade(pontosHabilidade),
                      Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: habilidades.length,
                          itemBuilder: (context, atual) {
                            Habilidade habilidade = habilidades[atual];

                            return ListTile(
                              title: Text(habilidade.titulo),
                              trailing: Checkbox(
                                value: isSelected(habilidade),
                                onChanged: (selected) {
                                  selecionarHabilidade(selected, habilidade);
                                },
                              ),
                              onTap: () {
                                exibirDescricaoHabilidade(habilidade);
                              },
                            );
                          },
                          separatorBuilder: (context, index) {
                            return CustomDivider(height: 1);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }

            if (state is ClasseCarregando) {
              return LoadingScreen();
            }

            return Container();
          },
        ),
      ),
    );
  }

  bool isSelected(Habilidade habilidade) {
    return habilidadesSelecionadas.contains(habilidade) ||
        personagem.habilidades
            .map((habilidade) => habilidade.titulo)
            .contains(habilidade.titulo);
  }

  void selecionarHabilidade(bool isSelected, Habilidade habilidade) {
    bool alredyHasHabilidade = personagem.habilidades
        .map((habilidade) => habilidade.titulo)
        .contains(habilidade.titulo);

    if (!alredyHasHabilidade) {
      if (pontosHabilidade > 0 && isSelected) {
        setState(() {
          habilidadesSelecionadas.add(habilidade);
          pontosHabilidade--;
        });
      }
      if (!isSelected) {
        setState(() {
          habilidadesSelecionadas.remove(habilidade);
          pontosHabilidade++;
        });
      }
    }
  }

  void exibirDescricaoHabilidade(Habilidade habilidade) {
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
