import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/bloc/cadastro_usuario_bloc/cadastro_usuario_bloc.dart';
import 'package:millenium/src/bloc/login_bloc/login_bloc.dart';
import 'package:millenium/src/repository/usuario/usuario_repository.dart';
import 'package:millenium/src/screens/cadastro_usuario/cadastro_usuario_form.dart';

class CadastroUsuarioScreen extends StatelessWidget {
  final UsuarioRepository _usuarioRepository;

  CadastroUsuarioScreen({
    Key key,
    @required UsuarioRepository usuarioRepository,
  })  : assert(usuarioRepository != null),
        _usuarioRepository = usuarioRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CadastroUsuarioBloc>(
          builder: (context) => CadastroUsuarioBloc(
            usuarioRepository: _usuarioRepository,
          ),
        ),
        BlocProvider<LoginBloc>(
          builder: (context) => LoginBloc(
            userRepository: _usuarioRepository,
          ),
        ),
      ],
      child: CadastroUsuarioForm(),
    );
  }
}
