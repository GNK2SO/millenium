import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:millenium/src/models/page_state.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/repository/usuario_repository.dart';
import 'package:millenium/src/validators/usuario_validator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class CadastroUsuarioBloc extends BlocBase with UsuarioValidator {
  final UsuarioRepository _usuarioRepository;

  CadastroUsuarioBloc({@required UsuarioRepository usuarioRepository})
      : assert(usuarioRepository != null),
        _usuarioRepository = usuarioRepository;

  //Controllers
  final _nomeController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _senhaController = BehaviorSubject<String>();
  final _confirmarSenhaController = BehaviorSubject<String>();
  final _stateController = BehaviorSubject<PageState>();

  //Streams
  Stream<String> get nomeStream =>
      _nomeController.stream.transform(isValidNome);
  Stream<String> get emailStream =>
      _emailController.stream.transform(isValidEmail);
  Stream<String> get senhaStream =>
      _senhaController.stream.transform(isValidSenha);
  Stream<String> get confirmarSenhaStream =>
      _confirmarSenhaController.stream.transform(isValidSenha).doOnData(
        (String confirmarSenha) {
          if (_senhaController.value != confirmarSenha) {
            _confirmarSenhaController.addError("Senhas não são iguais!");
          }
        },
      );
  Stream<PageState> get stateStream => _stateController.stream;

  //Sinks
  Sink<String> get nomeSink => _nomeController.sink;
  Sink<String> get emailSink => _emailController.sink;
  Sink<String> get senhaSink => _senhaController.sink;
  Sink<String> get confirmarSenhaSink => _confirmarSenhaController.sink;
  Sink<PageState> get stateSink => _stateController.sink;

  Stream<bool> get isFormValidate => Observable.combineLatest4(
      nomeStream,
      emailStream,
      senhaStream,
      confirmarSenhaStream,
      (nome, email, senha, confirmarSenha) => true);

  void salvarUsuario() async {
    if (_stateController.value != PageState.LOADING) {
      stateSink.add(PageState.LOADING);
      final usuario = Usuario(
        nome: _nomeController.value,
        email: _emailController.value,
        senha: _senhaController.value,
      );
      try {
        await _usuarioRepository.salvar(usuario);
        stateSink.add(PageState.SUCCESS);
      } catch (_) {
        stateSink.add(PageState.FAILED);
      }
    }
  }

  @override
  void dispose() {
    _nomeController.close();
    _emailController.close();
    _senhaController.close();
    _senhaController.close();
    _confirmarSenhaController.close();
    _stateController.close();
    super.dispose();
  }
}
