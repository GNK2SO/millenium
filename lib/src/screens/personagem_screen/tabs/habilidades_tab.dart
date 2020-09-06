import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_bloc.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_state.dart';
import 'package:millenium/src/components/tiles/habilidade_tile.dart';
import 'package:millenium/src/components/utils/custom_divider.dart';
import 'package:millenium/src/models/personagem/personagem.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/screens/add_habilidade/add_habilidade_screen.dart';
import 'package:millenium/src/screens/empty_screen.dart';
import 'package:millenium/src/util/util.dart';

class HabilidadesTab extends StatefulWidget {
  final Usuario usuario;
  final Personagem personagem;

  HabilidadesTab({
    @required this.usuario,
    @required this.personagem,
  });

  @override
  _HabilidadesTabState createState() => _HabilidadesTabState();
}

class _HabilidadesTabState extends State<HabilidadesTab> {
  Personagem personagem;

  @override
  void initState() {
    super.initState();
    personagem = widget.personagem;
  }

  @override
  Widget build(BuildContext context) {
    if (personagem.habilidades.isEmpty) {
      return EmptyScreen(
        mensagem: "Nenhuma habilidade encontrada!",
        fontSize: 20,
      );
    }
    return Scaffold(
      body: BlocListener<PersonagemBloc, PersonagemState>(
        listener: (context, state) {
          if (state is PersonagemCarregado) {
            setState(() {
              personagem = state.personagem;
            });
          }
        },
        child: ListView.separated(
          itemCount: personagem.habilidades.length,
          itemBuilder: (context, atual) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: HabilidadeTile(habilidade: personagem.habilidades[atual]),
            );
          },
          separatorBuilder: (context, index) {
            return CustomDivider(
              height: 1,
              width: MediaQuery.of(context).size.width,
            );
          },
        ),
      ),
      floatingActionButton: Visibility(
        visible: personagem.pontosHabilidade > 0 && !widget.usuario.isAdmin,
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            navigateTo(context, AddHabilidadeScreen(personagem: personagem));
          },
        ),
      ),
    );
  }
}
