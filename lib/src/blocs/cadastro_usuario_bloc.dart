import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:millenium/src/models/page_state.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/repository/usuario_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class CadastroUsuarioBloc extends BlocBase {
  final UsuarioRepository _usuarioRepository = UsuarioRepository();

  //Controllers
  final _nomeController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _senhaController = BehaviorSubject<String>();
  final _stateController = BehaviorSubject<PageState>();

  //Streams
  Stream<String> get nomeStream => _nomeController.stream;
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get senhaStream => _senhaController.stream;
  Stream<PageState> get stateStream => _stateController.stream;

  //Sinks
  Sink<String> get nomeSink => _nomeController.sink;
  Sink<String> get emailSink => _emailController.sink;
  Sink<String> get senhaSink => _senhaController.sink;
  Sink<PageState> get stateSink => _stateController.sink;

  void salvarUsuario() async {
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

  @override
  void dispose() {
    _nomeController.close();
    _emailController.close();
    _senhaController.close();
    _stateController.close();
    super.dispose();
  }
}
