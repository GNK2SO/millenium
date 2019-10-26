import 'package:flutter_test/flutter_test.dart';
import 'package:millenium/src/blocs/cadastro_usuario_bloc.dart';

import '../repository/mock_usuario_repository.dart';

main() {
  CadastroUsuarioBloc bloc;
  MockUsuarioRepository usuarioRepository;

  setUp(() {
    usuarioRepository = MockUsuarioRepository();
    bloc = CadastroUsuarioBloc(usuarioRepository: usuarioRepository);
  });

  test("Quando nome está vazio, emite erro", () {
    bloc.nomeSink.add("");
    expect(bloc.nomeStream, emitsError("Campo obrigatório!"));
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
    bloc.senhaSink.add("sdfsd#AS21");
    expect(
      bloc.senhaStream,
      emitsError("Senha não deve conter caracteres especiais!"),
    );
  });

  test("Quando confirmar senha está vazio, emite erro", () {
    bloc.confirmarSenhaSink.add("");
    expect(bloc.confirmarSenhaStream, emitsError("Campo obrigatório!"));
  });

  test("Quando tamanho da senha é menor que 6, emite erro", () {
    bloc.senhaSink.add("xxx12");
    expect(
      bloc.senhaStream,
      emitsError("Tamanho entre 6 a 16 caracteres!"),
    );
  });

  test("Quando tamanho da senha é maior que 16, emite erro", () {
    bloc.senhaSink.add("1234567890xxxxxxx");
    expect(
      bloc.senhaStream,
      emitsError("Tamanho entre 6 a 16 caracteres!"),
    );
  });

  test("Quando confirmar senha contém caracter especial, emite erro", () {
    bloc.confirmarSenhaSink.add("sdfsd#AS21");
    expect(
      bloc.confirmarSenhaStream,
      emitsError("Senha não deve conter caracteres especiais!"),
    );
  });

  test("Quando senha não coincidem, emite erro", () {
    bloc.senhaSink.add("123");
    bloc.confirmarSenhaSink.add("321");
    expect(
      bloc.confirmarSenhaStream,
      emitsError("Senhas não são iguais!"),
    );
  }, skip: "Verificar o motivo");

  // test("when submit form show indicator", () {});

  // test("when submit form and username is null emits errors", () {});

  // test("when submit form and username is empty emits errors", () {});

  // test("when submit form and password is null emits errors", () {});

  // test("when submit form and password is empty emits errors", () {});

  // test("when submit from and request fails emits error", () {});
}
