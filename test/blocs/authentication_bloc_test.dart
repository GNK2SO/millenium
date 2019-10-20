import 'package:flutter_test/flutter_test.dart';
import 'package:millenium/src/blocs/authentication_bloc.dart';

import '../repository/mock_usuario_repository.dart';

main() {
  AuthenticationBloc bloc;
  MockUsuarioRepository usuarioRepository;

  setUp(() {
    usuarioRepository = MockUsuarioRepository();
    bloc = AuthenticationBloc(usuarioRepository: usuarioRepository);
  });

  test("Quando email está vazio, emite erro", () {
    bloc.emailSink.add("");
    expect(bloc.emailStream, emitsError("Campo obrigatório!"));
  });

  test("Quando senha está vazio, emite erro", () {
    bloc.senhaSink.add("");
    expect(bloc.senhaStream, emitsError("Campo obrigatório!"));
  });

  test("Quando senha contém caracter especial, emite erro", () {
    bloc.senhaSink.add("@");
    expect(
      bloc.senhaStream,
      emitsError("Senha não deve conter caracteres especiais!"),
    );
  });

  // test("when submit form show indicator", () {});

  // test("when submit form and username is null emits errors", () {});

  // test("when submit form and username is empty emits errors", () {});

  // test("when submit form and password is null emits errors", () {});

  // test("when submit form and password is empty emits errors", () {});

  // test("when submit from and request fails emits error", () {});
}
