import 'package:flutter_test/flutter_test.dart';
import 'package:millenium/src/blocs/personagem_bloc.dart';

import '../repository/mock_personagem_repository.dart';

main() {
  PersonagemBloc bloc;
  MockPersonagemRepository personagemRepository;

  setUp(() {
    personagemRepository = MockPersonagemRepository();
    bloc = PersonagemBloc(personagemRepository: personagemRepository);
  });

  test("Quando nome está vazio, emite erro", () {
    bloc.nomeSink.add("");
    expect(bloc.nomeStream, emitsError("Campo obrigatório!"));
  });

  // test("when submit form show indicator", () {});

  // test("when submit form and username is null emits errors", () {});

  // test("when submit form and username is empty emits errors", () {});

  // test("when submit form and password is null emits errors", () {});

  // test("when submit form and password is empty emits errors", () {});

  // test("when submit from and request fails emits error", () {});
}
