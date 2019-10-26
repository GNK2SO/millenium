import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:millenium/src/blocs/cadastro_bloc/cadastro_event.dart';
import 'package:millenium/src/blocs/cadastro_bloc/cadastro_state.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/repository/usuario_repository.dart';

class CadastroBloc extends Bloc<CadastroEvent, CadastroState> {
  final UsuarioRepository _usuarioRepository;

  CadastroBloc({
    @required repository,
  })  : assert(repository != null),
        _usuarioRepository = repository;

  @override
  CadastroState get initialState => Screen();

  @override
  Stream<CadastroState> mapEventToState(CadastroEvent event) async* {
    if (event is SalvarUsuario) {
      yield* this._mapSalvarUsuarioToState(
          nome: event.nome, email: event.email, senha: event.senha);
    }
  }

  Stream<CadastroState> _mapSalvarUsuarioToState({
    String nome,
    String email,
    String senha,
  }) async* {
    if (!(state is Loading)) {
      yield Loading();
      try {
        await _usuarioRepository.salvar(Usuario(
          nome: nome,
          email: email,
          senha: senha,
        ));
        yield Success(
          usuario: await _usuarioRepository.obterUsuario(),
        );
      } catch (e) {
        yield Failure(erro: "Erro ao cadastrar.\nVerifique sua conexão.");
      }
    }
  }
}
