import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:millenium/src/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:millenium/src/bloc/authentication_bloc/authentication_event.dart';
import 'package:millenium/src/bloc/authentication_bloc/authentication_state.dart';
import 'package:millenium/src/bloc/bloc_delegate.dart';
import 'package:millenium/src/repository/usuario_repository.dart';
import 'package:millenium/src/screens/cadastro_usuario/cadastro_usuario_screen.dart';
import 'package:millenium/src/screens/classes/classes_screen.dart';
import 'package:millenium/src/screens/home_screen/home_screen.dart';
import 'package:millenium/src/screens/login/login_screen.dart';
import 'package:millenium/src/screens/personagem/personagem_screen.dart';
import 'package:millenium/src/screens/personagens/personagens_screen.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final UsuarioRepository usuarioRepository = UsuarioRepository();

  runApp(BlocProvider(
    builder: (context) =>
        AuthenticationBloc(usuarioRepository: usuarioRepository)
          ..dispatch(AppStarted()),
    child: Millenium(usuarioRepository: usuarioRepository),
  ));
}

class Millenium extends StatelessWidget {
  final UsuarioRepository _usuarioRepository;

  Millenium({Key key, @required UsuarioRepository usuarioRepository})
      : assert(usuarioRepository != null),
        _usuarioRepository = usuarioRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Uninitialized) {
            return Container();
          } else if (state is Unauthenticated) {
            return LoginScreen(usuarioRepository: _usuarioRepository);
          } else if (state is Authenticated) {
            return HomeScreen(
              usuario: state.usuario,
            );
          } else {
            throw Exception('Estado informado é inválido.');
          }
        },
      ),
      routes: {
        "/loginScreen": (context) =>
            LoginScreen(usuarioRepository: _usuarioRepository),
        "/cadastroContaScreen": (context) =>
            CadastroUsuarioScreen(usuarioRepository: _usuarioRepository),
        "/homeScreen": (context) => HomeScreen(),
        "/personagensScreen": (context) => PersonagensScreen(),
        "/personagemScreen": (context) => PersonagemScreen(),
        "/classesScreen": (context) => ClassesScreen(),
      },
    );
  }
}
