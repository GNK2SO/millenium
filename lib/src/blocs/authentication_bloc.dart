import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:millenium/src/models/page_state.dart';
import 'package:millenium/src/repository/usuario_repository.dart';
import 'package:millenium/src/validators/usuario_validator.dart';
import 'package:rxdart/subjects.dart';

class AuthenticationBloc extends BlocBase with UsuarioValidator {
  final UsuarioRepository _usuarioRepository;

  AuthenticationBloc({@required UsuarioRepository usuarioRepository})
      : assert(usuarioRepository != null),
        _usuarioRepository = usuarioRepository;

  //Controllers
  final _stateController =
      BehaviorSubject<PageState>.seeded(PageState.INITIALIZATION);
  final _emailController = BehaviorSubject<String>();
  final _senhaController = BehaviorSubject<String>();

  //Streams
  Stream<String> get emailStream =>
      _emailController.stream.transform(isValidNome);
  Stream<String> get senhaStream =>
      _senhaController.stream.transform(isValidSenha);
  Stream<PageState> get stateStream => _stateController.stream;

  //Sinks
  Sink<String> get emailSink => _emailController.sink;
  Sink<String> get senhaSink => _senhaController.sink;
  Sink<PageState> get stateSink => _stateController.sink;

  void appInitialization() async {
    try {
      final bool estaAutenticado = await _usuarioRepository.estaAutenticado();
      if (estaAutenticado) {
        stateSink.add(PageState.AUTHENTICADED);
      } else {
        stateSink.add(PageState.UNAUTHENTICADED);
      }
    } catch (_) {
      stateSink.add(PageState.FAILED);
    }
  }

  void efetuarLogin() async {
    stateSink.add(PageState.LOADING);
    try {
      await _usuarioRepository.efetuarLogin(
        email: _emailController.value,
        senha: _senhaController.value,
      );
      stateSink.add(PageState.SUCCESS);
    } catch (_) {
      stateSink.add(PageState.FAILED);
    }
  }

  void efetuarLogout() {
    _usuarioRepository.efetuarLogout();
  }

  @override
  void dispose() {
    _emailController.close();
    _senhaController.close();
    _stateController.close();
    super.dispose();
  }
}
