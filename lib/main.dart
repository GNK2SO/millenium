import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:millenium/millenium_app.dart';
import 'package:millenium/src/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:millenium/src/blocs/authentication_bloc/authentication_event.dart';
import 'package:millenium/src/blocs/bloc_delegate.dart';
import 'package:millenium/src/repository/usuario_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final UsuarioRepository usuarioRepository = UsuarioRepository();

  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(
        usuarioRepository: usuarioRepository,
      )..add(AppStarted()),
      child: Millenium(),
    ),
  );
}
