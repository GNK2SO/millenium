import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:millenium/src/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:millenium/src/blocs/authentication_bloc/authentication_event.dart';
import 'package:millenium/src/blocs/authentication_bloc/authentication_state.dart';
import 'package:millenium/src/blocs/bloc_delegate.dart';
import 'package:millenium/src/blocs/usuario_bloc/usuario_bloc.dart';
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
import 'package:millenium/src/screens/todos_personagens/todos_personagens_screen.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_bloc.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final UsuarioRepository usuarioRepository = UsuarioRepository();

  runApp(BlocProvider(
    create: (context) => AuthenticationBloc(usuarioRepository: usuarioRepository)..add(AppStarted()),
    child: Millenium(),
  ));
}

class Millenium extends StatelessWidget {
  Usuario usuario;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PersonagemBloc>(
          create: (context) => PersonagemBloc(repository: PersonagemRepository()),
        ),
        BlocProvider<UsuarioBloc>(
          create: (context) => UsuarioBloc(repository: UsuarioRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is Uninitialized) {
              return LoadingScreen();
            } else if (state is Unauthenticated) {
              return LoginScreen(
                repository: UsuarioRepository(),
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
          "/loginScreen": (context) => LoginScreen(repository: UsuarioRepository()),
          "/cadastroContaScreen": (context) => CadastroScreen(repository: UsuarioRepository()),
          "/meusPersonagensScreen": (context) => MeusPersonagensScreen(usuario: this.usuario),
          "/todosPersonagemScreen": (context) => TodosPersonagensScreen(usuario: this.usuario),
          "/bestiarioScreen": (context) => BestiarioScreen(
                usuario: this.usuario,
                repository: BestiarioRepository(),
              ),
        },
      ),
    );
  }
}
