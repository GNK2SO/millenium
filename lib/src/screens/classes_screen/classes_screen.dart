import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:millenium/src/blocs/classe_bloc/classe_bloc.dart';
import 'package:millenium/src/blocs/classe_bloc/classe_event.dart';
import 'package:millenium/src/blocs/classe_bloc/classe_state.dart';
import 'package:millenium/src/components/drawer.dart';
import 'package:millenium/src/models/habilidade/habilidade.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/repository/classe_repository.dart';
import 'package:millenium/src/screens/classes_screen/tabs/assassino_tab.dart';
import 'package:millenium/src/screens/classes_screen/tabs/barbaro_tab.dart';
import 'package:millenium/src/screens/classes_screen/tabs/cacador_tab.dart';
import 'package:millenium/src/screens/classes_screen/tabs/guerreiro_tab.dart';
import 'package:millenium/src/screens/classes_screen/tabs/mago_tab.dart';
import 'package:millenium/src/screens/error_screen.dart';
import 'package:millenium/src/screens/loading_screen.dart';

class ClassesScreen extends StatelessWidget {
  final Usuario usuario;

  ClassesScreen({@required this.usuario});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ClasseBloc>(
      create: (context) => ClasseBloc(repository: ClasseRepository()),
      child: Body(
        usuario: usuario,
      ),
    );
  }
}

class Body extends StatefulWidget {
  final Usuario usuario;

  Body({@required this.usuario});

  @override
  _BodyState createState() => _BodyState(
        usuario: usuario,
      );
}

class _BodyState extends State<Body> {
  final Usuario usuario;

  _BodyState({@required this.usuario});

  final List<SvgPicture> tabs = [
    SvgPicture.asset(
      "assets/icons/swords.svg",
      width: 24,
      color: Colors.white,
      semanticsLabel: 'Guerreiro',
    ),
    SvgPicture.asset(
      "assets/icons/crossbow.svg",
      width: 24,
      color: Colors.white,
      semanticsLabel: 'Caçador',
    ),
    SvgPicture.asset(
      "assets/icons/axe.svg",
      width: 24,
      color: Colors.white,
      semanticsLabel: 'Bárbaro',
    ),
    SvgPicture.asset(
      "assets/icons/dagger.svg",
      width: 24,
      color: Colors.white,
      semanticsLabel: 'Assassino',
    ),
    SvgPicture.asset(
      "assets/icons/sceptre.svg",
      width: 24,
      color: Colors.white,
      semanticsLabel: 'Mago',
    ),
  ];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ClasseBloc>(context).add(ObterClasses());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClasseBloc, ClasseState>(
      builder: (context, state) {
        if (state is ClassesCarregadas) {
          return DefaultTabController(
            length: tabs.length,
            child: Scaffold(
              appBar: AppBar(
                title: Text("Classes"),
                bottom: TabBar(
                  tabs: tabs.map((tab) => Tab(child: tab)).toList(),
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  GuerreiroTab(
                    habilidades: mapToListHabilidade(
                      state.classes,
                      "guerreiro",
                    ),
                    habilidadesAprendizagem: mapToListHabilidadeAprendizagem(
                      state.classes,
                      "guerreiro",
                    ),
                  ),
                  CacadorTab(
                    habilidades: mapToListHabilidade(
                      state.classes,
                      "cacador",
                    ),
                    habilidadesAprendizagem: mapToListHabilidadeAprendizagem(
                      state.classes,
                      "cacador",
                    ),
                  ),
                  BarbaroTab(
                    habilidades: mapToListHabilidade(
                      state.classes,
                      "barbaro",
                    ),
                    habilidadesAprendizagem: mapToListHabilidadeAprendizagem(
                      state.classes,
                      "barbaro",
                    ),
                  ),
                  AssassinoTab(
                    habilidades: mapToListHabilidade(
                      state.classes,
                      "assassino",
                    ),
                    habilidadesAprendizagem: mapToListHabilidadeAprendizagem(
                      state.classes,
                      "assassino",
                    ),
                  ),
                  MagoTab(
                    habilidades: mapToListHabilidade(
                      state.classes,
                      "mago",
                    ),
                    habilidadesAprendizagem: mapToListHabilidadeAprendizagem(
                      state.classes,
                      "mago",
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is ClasseFailure) {
          return ErroScreen(erro: state.erro);
        } else {
          return LoadingScreen();
        }
      },
    );
  }

  List<Habilidade> mapToListHabilidade(
    Map<String, dynamic> classes,
    String classe,
  ) {
    List<Habilidade> habilidades = [];

    classes[classe]["habilidades"].forEach((habilidade) {
      habilidades.add(Habilidade(
        titulo: habilidade["titulo"],
        tipo: habilidade["tipo"],
        custo: habilidade["custo"],
        descricao: habilidade["descricao"],
      ));
    });

    return habilidades;
  }

  List<Habilidade> mapToListHabilidadeAprendizagem(
    Map<String, dynamic> classes,
    String classe,
  ) {
    List<Habilidade> habilidades = [];

    classes[classe]["habilidadesAprendizagem"].forEach((habilidade) {
      habilidades.add(Habilidade(
        titulo: habilidade["titulo"],
        tipo: habilidade["tipo"],
        custo: habilidade["custo"],
        descricao: habilidade["descricao"],
      ));
    });

    return habilidades;
  }
}
