import 'package:bloc_pattern/bloc_pattern.dart';

import 'package:flutter/material.dart';
import 'package:millenium/src/blocs/personagem_bloc.dart';
import 'package:millenium/src/components/app_bar.dart';
import 'package:millenium/src/components/drawer.dart';
import 'package:millenium/src/components/list/personagem_tile.dart';
import 'package:millenium/src/components/utils/custom_divider.dart';
import 'package:millenium/src/models/personagem.dart';
import 'package:millenium/src/models/usuario.dart';

//Tela onde o MESTRE visualiza todos os personagens de todos os players
class PersonagensScreen extends StatefulWidget {
  final Usuario _usuario;

  PersonagensScreen({@required Usuario usuario})
      : assert(usuario != null),
        _usuario = usuario;

  @override
  _PersonagensScreenState createState() => _PersonagensScreenState();
}

class _PersonagensScreenState extends State<PersonagensScreen> {
  final _bloc = BlocProvider.getBloc<PersonagemBloc>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(),
      drawer: CustomDrawer(
        usuario: this.widget._usuario,
      ),
      body: StreamBuilder(
        stream: _bloc.obterTodosPersonagens(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              if (snapshot.hasData) {
                List<Personagem> personagens =
                    _bloc.mapToList(documents: snapshot.data.documents);

                return ListView.separated(
                  itemCount: personagens.length,
                  itemBuilder: (context, index) {
                    return PersonagemTile(
                      personagem: personagens[index],
                      usuario: this.widget._usuario,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return CustomDivider(height: 1);
                  },
                );
              }
              return Container();
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              return Container();
          }
        },
      ),
    );
  }
}
