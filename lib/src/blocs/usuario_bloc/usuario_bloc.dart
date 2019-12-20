import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:millenium/src/blocs/usuario_bloc/usuario_event.dart';
import 'package:millenium/src/blocs/usuario_bloc/usuario_state.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/repository/usuario_repository.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  final UsuarioRepository _usuarioRepository;

  UsuarioBloc({
    @required repository,
  })  : assert(repository != null),
        _usuarioRepository = repository;

  @override
  UsuarioState get initialState => UsuarioInitial();

  @override
  Stream<UsuarioState> mapEventToState(UsuarioEvent event) async* {
    if (event is SalvarUsuario) {
      yield* this._mapSalvarUsuarioToState(
          nome: event.nome, email: event.email, senha: event.senha);
    }
  }

  Stream<UsuarioState> _mapSalvarUsuarioToState({
    String nome,
    String email,
    String senha,
  }) async* {
    if (!(state is UsuarioCarregando)) {
      yield UsuarioCarregando();
      try {
        await _usuarioRepository.salvar(Usuario(
          nome: nome,
          email: email,
          senha: senha,
        ));
        yield UsuarioSuccess(
          usuario: await _usuarioRepository.obterUsuario(),
        );
      } catch (e) {
        yield UsuarioFailure(erro: "Erro ao cadastrar.\nVerifique sua conexão.");
      }
    }
  }
}
