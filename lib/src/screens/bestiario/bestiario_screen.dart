import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/blocs/bestiario_bloc/bestiario_bloc.dart';
import 'package:millenium/src/blocs/bestiario_bloc/bestiario_event.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/repository/bestiario_repository.dart';
import 'package:millenium/src/screens/bestiario/bestiario_form.dart';

class BestiarioScreen extends StatelessWidget {
  final Usuario _usuario;
  final BestiarioRepository _bestiarioRepository;

  BestiarioScreen({
    Key key,
    @required Usuario usuario,
    @required BestiarioRepository repository,
  })  : assert(repository != null && usuario != null),
        _usuario = usuario,
        _bestiarioRepository = repository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BestiarioBloc>(
      create: (context) => BestiarioBloc(repository: _bestiarioRepository)
        ..add(ObterBestiario()),
      child: BestiarioForm(
        usuario: _usuario,
      ),
    );
  }
}
