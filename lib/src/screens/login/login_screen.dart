import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/bloc/login_bloc/login_bloc.dart';
import 'package:millenium/src/repository/usuario/usuario_repository.dart';
import 'package:millenium/src/screens/login/login_form.dart';

class LoginScreen extends StatelessWidget {
  final UsuarioRepository _usuarioRepository;

  LoginScreen({Key key, @required UsuarioRepository usuarioRepository})
      : assert(usuarioRepository != null),
        _usuarioRepository = usuarioRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      builder: (context) => LoginBloc(userRepository: _usuarioRepository),
      child: LoginForm(),
    );
  }
}
