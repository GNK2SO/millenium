import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:millenium/src/blocs/authentication_bloc/authentication_state.dart';
import 'package:millenium/src/blocs/classe_bloc/classe_bloc.dart';
import 'package:millenium/src/blocs/usuario_bloc/usuario_bloc.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/repository/bestiario_repository.dart';
import 'package:millenium/src/repository/usuario_repository.dart';
import 'package:millenium/src/screens/alterar_senha/alterar_senha_screen.dart';
import 'package:millenium/src/screens/bestiario/bestiario_screen.dart';
import 'package:millenium/src/screens/cadastro/cadastro_screen.dart';
import 'package:millenium/src/screens/classes_screen/classes_screen.dart';
import 'package:millenium/src/screens/error_screen.dart';
import 'package:millenium/src/screens/home_screen_admin/home_screen_admin.dart';
import 'package:millenium/src/screens/login/login_screen.dart';
import 'package:millenium/src/screens/home_screen/home_screen.dart';
import 'package:millenium/src/screens/perfil/perfil_screen.dart';
import 'package:millenium/src/screens/regras_screen/regras_screen.dart';
import 'package:millenium/src/screens/splash_screen.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_bloc.dart';
import 'package:millenium/src/service/classe_service.dart';
import 'package:millenium/src/service/personagem_service.dart';
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
            repository: PersonagemService(),
          ),
        ),
        BlocProvider<UsuarioBloc>(
          create: (context) => UsuarioBloc(
            repository: UsuarioRepository(),
          ),
        ),
        BlocProvider<ClasseBloc>(
          create: (context) => ClasseBloc(
            repository: ClasseService(),
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
              usuario = null;
              return LoginScreen(repository: UsuarioRepository());
            } else if (state is Authenticated) {
              if (usuario == null) {
                usuario = state.usuario;
              }
              if (usuario.isAdmin) {
                return HomeScreenAdmin(usuario: usuario);
              }
              return HomeScreen(usuario: usuario);
            } else {
              return ErroScreen();
            }
          },
        ),
        routes: {
          "/regrasScreen": (context) => RegrasScreen(usuario: usuario),
          "/classesScreen": (context) => ClassesScreen(usuario: usuario),
          "/perfilScreen": (context) => PerfilScreen(usuario: usuario),
          "/alterarSenhaScreen": (context) => AlterarSenhaScreen(),
          "/loginScreen": (context) =>
              LoginScreen(repository: UsuarioRepository()),
          "/cadastroContaScreen": (context) =>
              CadastroScreen(repository: UsuarioRepository()),
          "/bestiarioScreen": (context) => BestiarioScreen(
              usuario: usuario, repository: BestiarioRepository()),
        },
      ),
    );
  }
}
