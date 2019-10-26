import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:millenium/src/blocs/authentication_bloc.dart';
import 'package:millenium/src/blocs/personagem_bloc.dart';
import 'package:millenium/src/blocs/usuario_bloc.dart';
import 'package:millenium/src/models/page_state.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/repository/personagem_repository.dart';
import 'package:millenium/src/repository/usuario_repository.dart';
import 'package:millenium/src/screens/cadastro_usuario_screen.dart';
import 'package:millenium/src/screens/jogador/jogador_home_screen.dart';
import 'package:millenium/src/screens/login_screen.dart';
import 'package:millenium/src/screens/mestre/mestre_home_screen.dart';
import 'package:millenium/src/screens/splash_screen.dart';

void main() => runApp(Millenium());

class Millenium extends StatefulWidget {
  @override
  _MilleniumState createState() => _MilleniumState();
}

class _MilleniumState extends State<Millenium> {
  final UsuarioRepository _usuarioRepository = UsuarioRepository();
  AuthenticationBloc _auth;
  UsuarioBloc _userbloc;

  @override
  void initState() {
    super.initState();
    _auth = AuthenticationBloc(usuarioRepository: _usuarioRepository);
    _userbloc = UsuarioBloc();
    _auth.stateStream.listen((state) {
      if (state == PageState.INITIALIZATION) {
        _auth.appInitialization();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => UsuarioBloc()),
        Bloc((i) => AuthenticationBloc(usuarioRepository: _usuarioRepository)),
        Bloc(
          (i) => PersonagemBloc(
            personagemRepository: PersonagemRepository(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder<PageState>(
          stream: _auth.stateStream,
          builder: (context, snapshotPageState) {
            switch (snapshotPageState.data) {
              case PageState.AUTHENTICADED:
                return FutureBuilder<Usuario>(
                  future: _userbloc.obterUsuario(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        snapshot.connectionState == ConnectionState.done) {
                      Usuario usuario = snapshot.data;
                      if (usuario.isAdmin) {
                        return MestreHomeScreen(
                          usuario: usuario,
                        );
                      } else {
                        return JogadorHomeScreen(
                          usuario: usuario,
                        );
                      }
                    } else if (snapshot.hasError) {
                      return Scaffold(
                        body: Container(
                          color: Colors.white,
                          child: Center(
                            child: Text("Falha na conexão!"),
                          ),
                        ),
                      );
                    } else {
                      return SplashScreen();
                    }
                  },
                );
              case PageState.UNAUTHENTICADED:
                return LoginScreen();
              default:
                return SplashScreen();
            }
          },
        ),
        routes: {
          "/cadastroContaScreen": (context) => CadastroUsuarioScreen(),
        },
      ),
    );
  }
}
