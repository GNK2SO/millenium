import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/repository/usuario_repository.dart';

class UsuarioBloc extends BlocBase {
  final UsuarioRepository _usuarioRepository = UsuarioRepository();

  Future<Usuario> obterUsuario() async {
    return await _usuarioRepository.obterUsuario();
  }
}
