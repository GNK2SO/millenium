import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/blocs/bestiario_bloc/bestiario_bloc.dart';
import 'package:millenium/src/blocs/bestiario_bloc/bestiario_state.dart';
import 'package:millenium/src/components/app_bar.dart';
import 'package:millenium/src/components/drawer.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/screens/error_screen.dart';
import 'package:millenium/src/screens/loading_screen.dart';

class BestiarioForm extends StatefulWidget {
  final Usuario usuario;
  BestiarioForm({@required this.usuario});

  @override
  _BestiarioFormState createState() => _BestiarioFormState(usuario: usuario);
}

class _BestiarioFormState extends State<BestiarioForm> {
  final Usuario usuario;
  _BestiarioFormState({@required this.usuario});

  @override
  Widget build(BuildContext context) {
    return BlocListener<BestiarioBloc, BestiarioState>(
      listener: (context, state) {},
      child: Scaffold(
        appBar: CustomAppBar(),
        drawer: CustomDrawer(
          usuario: this.usuario,
        ),
        body: BlocBuilder<BestiarioBloc, BestiarioState>(
          builder: (context, state) {
            if (state is BestiarioCarregado) {
              if (state.bestiario.isEmpty) {
                return Center(
                  child: Text(
                    'Nehuma besta cadastrada',
                    style: Theme.of(context).textTheme.headline,
                  ),
                );
              } else {
                return GridView.count(
                  crossAxisCount: 3,
                  children: List.generate(100, (index) {
                    return Center(
                      child: Text(
                        'Item $index',
                        style: Theme.of(context).textTheme.headline,
                      ),
                    );
                  }),
                );
              }
            } else if (state is BestiarioCarregando) {
              return LoadingScreen();
            } else if (state is BestiarioFailure) {
              return ErroScreen();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
