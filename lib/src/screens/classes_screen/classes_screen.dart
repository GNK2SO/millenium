import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:millenium/src/blocs/classe_bloc/classe_bloc.dart';
import 'package:millenium/src/blocs/classe_bloc/classe_event.dart';
import 'package:millenium/src/blocs/classe_bloc/classe_state.dart';
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
                    classe: state.classes
                        .singleWhere((classe) => classe.nome == "Guerreiro"),
                  ),
                  CacadorTab(
                    classe: state.classes
                        .singleWhere((classe) => classe.nome == "Caçador"),
                  ),
                  BarbaroTab(
                    classe: state.classes
                        .singleWhere((classe) => classe.nome == "Bárbaro"),
                  ),
                  AssassinoTab(
                    classe: state.classes
                        .singleWhere((classe) => classe.nome == "Assassino"),
                  ),
                  MagoTab(
                    classe: state.classes
                        .singleWhere((classe) => classe.nome == "Mago"),
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
}
