import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:millenium/src/blocs/authentication_bloc/authentication_state.dart';
import 'package:millenium/src/blocs/usuario_bloc/usuario_bloc.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/repository/personagem_repository.dart';
import 'package:millenium/src/repository/usuario_repository.dart';
import 'package:millenium/src/screens/error_screen.dart';
import 'package:millenium/src/screens/home_screen.dart';
import 'package:millenium/src/screens/login/login_screen.dart';
import 'package:millenium/src/screens/splash_screen.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_bloc.dart';
import 'package:millenium/src/util/rotas.dart';
import 'package:millenium/src/util/theme.dart';

class Millenium extends StatefulWidget {
  @override
  _MilleniumState createState() => _MilleniumState();
}

class _MilleniumState extends State<Millenium> {
  Usuario usuario;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PersonagemBloc>(
          create: (context) => PersonagemBloc(
            repository: PersonagemRepository(),
          ),
        ),
        BlocProvider<UsuarioBloc>(
          create: (context) => UsuarioBloc(
            repository: UsuarioRepository(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: temaNorte,
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is Uninitialized) {
              return SplashScreen();
            } else if (state is Unauthenticated) {
              return LoginScreen(repository: UsuarioRepository());
            } else if (state is Authenticated) {
              if (usuario == null) {
                usuario = state.usuario;
              }
              return HomeScreen(usuario: usuario);
            } else {
              return ErroScreen();
            }
          },
        ),
        routes: Routes.getRoutes(usuario),
      ),
    );
  }
}