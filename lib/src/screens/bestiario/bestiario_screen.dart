import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/blocs/bestiario_bloc/bestiario_bloc.dart';
import 'package:millenium/src/blocs/bestiario_bloc/bestiario_event.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/screens/bestiario/bestiario_list.dart';
import 'package:millenium/src/service/bestiario_service.dart';

class BestiarioScreen extends StatelessWidget {
  final Usuario _usuario;
  final BestiarioService _bestiarioService;

  BestiarioScreen({
    Key key,
    @required Usuario usuario,
    @required BestiarioService repository,
  })  : assert(repository != null && usuario != null),
        _usuario = usuario,
        _bestiarioService = repository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BestiarioBloc>(
      create: (context) {
        return BestiarioBloc(
          repository: _bestiarioService,
        )..add(ObterBestiario());
      },
      child: BestiarioList(usuario: _usuario),
    );
  }
}
