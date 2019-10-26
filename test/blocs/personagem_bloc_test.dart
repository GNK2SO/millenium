import 'package:flutter_test/flutter_test.dart';
import 'package:millenium/src/blocs/personagem_bloc.dart';
import 'package:millenium/src/models/page_state.dart';
import 'package:millenium/src/models/page_state_info.dart';

import '../repository/mock_personagem_repository.dart';

main() {
  PersonagemBloc bloc;
  MockPersonagemRepository personagemRepository;

  setUp(() {
    personagemRepository = MockPersonagemRepository();
    bloc = PersonagemBloc(personagemRepository: personagemRepository);
  });

  tearDown(() {
    bloc.dispose();
  });

  test("Estado inicial é SCREEN", () {
    expect(bloc.nomeStream, emitsError("Campo obrigatório!"));
  }, skip: "Verificar como testar");

  test("Quando nome está vazio, emite erro", () {
    bloc.nomeSink.add("");
    expect(bloc.nomeStream, emitsError("Campo obrigatório!"));
  });

  test("State inicial é o screen", () {
    expect(bloc.stateStream,
        emitsInOrder([PageStateInfo(state: PageState.SCREEN)]));
  }, skip: "Verificar como testar");
}
