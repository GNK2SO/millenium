import 'package:flutter/cupertino.dart';
import 'package:bloc/bloc.dart';
import 'package:millenium/src/bloc/authentication_bloc/authentication_event.dart';
import 'package:millenium/src/repository/usuario/usuario_repository.dart';

import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UsuarioRepository _usuarioRepository;

  AuthenticationBloc({@required usuarioRepository})
      : assert(usuarioRepository != null),
        _usuarioRepository = usuarioRepository;

  @override
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      final bool estaAutenticado = await _usuarioRepository.estaAutenticado();
      if (estaAutenticado) {
        yield Authenticated(await _usuarioRepository.obterUsuario());
      } else {
        yield Unauthenticated();
      }
    } catch (_) {
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState() async* {
    yield Authenticated(await _usuarioRepository.obterUsuario());
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    _usuarioRepository.efetuarLogout();
    yield Unauthenticated();
  }
}
