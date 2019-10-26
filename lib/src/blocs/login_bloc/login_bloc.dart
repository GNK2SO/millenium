import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:millenium/src/blocs/login_bloc/login_event.dart';
import 'package:millenium/src/blocs/login_bloc/login_state.dart';
import 'package:millenium/src/repository/usuario_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UsuarioRepository _usuarioRepository;

  LoginBloc({
    @required repository,
  })  : assert(repository != null),
        _usuarioRepository = repository;

  @override
  LoginState get initialState => Screen();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is Autenticar) {
      yield* this._mapAutenticarToState(email: event.email, senha: event.senha);
    }
  }

  Stream<LoginState> _mapAutenticarToState(
      {String email, String senha}) async* {
    yield Loading();
    try {
      await _usuarioRepository.efetuarLogin(email: email, senha: senha);
      yield Success(
        usuario: await _usuarioRepository.obterUsuario(),
      );
    } catch (e) {
      print(e);
      yield Failure(erro: "Erro ao autenticar.\nVerifique sua conexão.");
    }
  }
}
