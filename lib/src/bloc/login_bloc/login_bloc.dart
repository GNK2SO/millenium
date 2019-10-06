import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:millenium/src/bloc/login_bloc/login_event.dart';
import 'package:millenium/src/bloc/login_bloc/login_state.dart';
import 'package:millenium/src/repository/usuario_repository.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UsuarioRepository _acessoRepository;

  LoginBloc({
    @required userRepository,
  })  : assert(userRepository != null),
        _acessoRepository = userRepository;

  @override
  LoginState get initialState => LoginState.empty();

  @override
  Stream<LoginState> transformEvents(Stream<LoginEvent> events,
      Stream<LoginState> Function(LoginEvent event) next) {
    final observableStream = events as Observable<LoginEvent>;
    final nonDebounceStream = observableStream
        .where((event) => (event is! EmailChanged && event is! SenhaChanged));

    final debounceStream = observableStream
        .where((event) => event is EmailChanged || event is SenhaChanged)
        .debounceTime(Duration(microseconds: 300));

    return super
        .transformEvents(nonDebounceStream.mergeWith([debounceStream]), next);
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is EmailChanged) {
      yield* this._mapEmailChangedToState(event.email);
    } else if (event is SenhaChanged) {
      yield* this._mapSenhaChangeToState(event.senha);
    } else if (event is LoginWithCredentialsPressed) {
      yield* this._mapLoginWithCredentialsPressedToState(
          email: event.email, senha: event.senha);
    }
  }

  Stream<LoginState> _mapEmailChangedToState(String email) async* {
    yield currentState.update(isEmailValid: email.isNotEmpty);
  }

  Stream<LoginState> _mapSenhaChangeToState(String senha) async* {
    yield currentState.update(isSenhaValid: senha.isNotEmpty);
  }

  Stream<LoginState> _mapLoginWithCredentialsPressedToState(
      {String email, String senha}) async* {
    yield LoginState.loading();
    try {
      await _acessoRepository.efetuarLogin(email: email, senha: senha);
      yield LoginState.success();
    } catch (e) {
      print(e);
      yield LoginState.failure();
    }
  }
}
