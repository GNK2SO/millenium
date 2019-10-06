import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:millenium/src/bloc/cadastro_usuario_bloc/cadastro_usuario_event.dart';
import 'package:millenium/src/bloc/cadastro_usuario_bloc/cadastro_usuario_state.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/repository/usuario_repository.dart';

class CadastroUsuarioBloc
    extends Bloc<CadastroUsuarioEvent, CadastroUsuarioState> {
  final UsuarioRepository _usuarioRepository;

  CadastroUsuarioBloc({@required usuarioRepository})
      : assert(usuarioRepository != null),
        _usuarioRepository = usuarioRepository;

  @override
  CadastroUsuarioState get initialState => CadastroUsuarioState.empty();

  @override
  Stream<CadastroUsuarioState> mapEventToState(
      CadastroUsuarioEvent event) async* {
    if (event is FormSubmitted) {
      yield* _mapFormSubmittedToState(
        email: event.email,
        senha: event.senha,
        nome: event.nome,
      );
    }
  }

  Stream<CadastroUsuarioState> _mapFormSubmittedToState({
    String nome,
    String email,
    String senha,
  }) async* {
    yield CadastroUsuarioState.loading();
    final usuario = Usuario(
      email: email,
      senha: senha,
      nome: nome,
    );
    try {
      await _usuarioRepository.salvar(usuario);
      yield CadastroUsuarioState.success();
    } catch (_) {
      print(_);
      yield CadastroUsuarioState.failure();
    }
  }
}
