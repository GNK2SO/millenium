import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:millenium/src/models/page_state.dart';
import 'package:millenium/src/repository/usuario_repository.dart';
import 'package:rxdart/subjects.dart';

class AuthenticationBloc extends BlocBase {
  final UsuarioRepository _usuarioRepository = UsuarioRepository();

  //Controllers
  final _stateController =
      BehaviorSubject<PageState>.seeded(PageState.INITIALIZATION);
  final _emailController = BehaviorSubject<String>();
  final _senhaController = BehaviorSubject<String>();

  //Streams
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get senhaStream => _senhaController.stream;
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
