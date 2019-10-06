import 'package:bloc/bloc.dart';
import 'package:millenium/src/bloc/personagem_bloc/personagem_event.dart';
import 'package:millenium/src/bloc/personagem_bloc/personagem_state.dart';
import 'package:millenium/src/models/atributos.dart';
import 'package:millenium/src/models/personagem.dart';
import 'package:millenium/src/repository/personagem_repository.dart';

class PersonagemBloc extends Bloc<PersonagemEvent, PersonagemState> {
  final PersonagemRepository _personagemRepository = PersonagemRepository();

  @override
  PersonagemState get initialState => PersonagemState.empty();

  @override
  Stream<PersonagemState> mapEventToState(PersonagemEvent event) async* {
    if (event is FormSubmitted) {
      yield* _mapFormSubmittedToState(
        nome: event.nome,
        idUsuario: event.idUsuario,
        atributos: event.atributos,
      );
    }
  }

  Stream<PersonagemState> _mapFormSubmittedToState(
      {String nome, String idUsuario, Atributos atributos}) async* {
    yield PersonagemState.loading();
    final personagem = Personagem(
      nome: nome,
      atributos: atributos,
    );
    try {
      await _personagemRepository.salvar(personagem, idUsuario);
      yield PersonagemState.success();
    } catch (_) {
      print(_);
      yield PersonagemState.failure();
    }
  }
}
