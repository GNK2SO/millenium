import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:millenium/src/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:millenium/src/blocs/authentication_bloc/authentication_event.dart';
import 'package:millenium/src/blocs/authentication_bloc/authentication_state.dart';
import 'package:millenium/src/blocs/bloc_delegate.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/repository/bestiario_repository.dart';
import 'package:millenium/src/repository/personagem_repository.dart';
import 'package:millenium/src/repository/usuario_repository.dart';
import 'package:millenium/src/screens/bestiario/bestiario_screen.dart';
import 'package:millenium/src/screens/cadastro/cadastro_screen.dart';
import 'package:millenium/src/screens/error_screen.dart';
import 'package:millenium/src/screens/home_screen.dart';
import 'package:millenium/src/screens/loading_screen.dart';
import 'package:millenium/src/screens/login/login_screen.dart';
import 'package:millenium/src/screens/meus_personagens_screen/meus_personagens_screen.dart';
import 'package:millenium/src/screens/personagem_screen/personagem_screen.dart';
import 'package:millenium/src/screens/todos_personagens/todos_personagens_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
  Usuario usuario;
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
            return LoadingScreen();
          } else if (state is Unauthenticated) {
            return LoginScreen(
              repository: _usuarioRepository,
            );
          } else if (state is Authenticated) {
            usuario = state.usuario;
            return HomeScreen(usuario: this.usuario);
          } else {
            return ErroScreen();
          }
        },
      ),
      routes: {
        "/loginScreen": (context) =>
            LoginScreen(repository: _usuarioRepository),
        "/cadastroContaScreen": (context) =>
            CadastroScreen(repository: _usuarioRepository),
        "/meusPersonagensScreen": (context) => MeusPersonagensScreen(
              usuario: this.usuario,
              repository: PersonagemRepository(),
            ),
        "/personagemScreen": (context) => PersonagemScreen(
              usuario: this.usuario,
              repository: PersonagemRepository(),
            ),
        "/todosPersonagemScreen": (context) => TodosPersonagensScreen(
              usuario: this.usuario,
              repository: PersonagemRepository(),
            ),
        "/bestiarioScreen": (context) => BestiarioScreen(
              usuario: this.usuario,
              repository: BestiarioRepository(),
            ),
      },
    );
  }
}
