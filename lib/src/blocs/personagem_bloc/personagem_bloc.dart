import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_event.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_state.dart';
import 'package:millenium/src/models/personagem/personagem.dart';
import 'package:millenium/src/service/personagem_service.dart';

import 'personagem_state.dart';

class PersonagemBloc extends Bloc<PersonagemEvent, PersonagemState> {
  final PersonagemService _service;

  PersonagemBloc({
    @required repository,
  })  : assert(repository != null),
        _service = repository;

  @override
  PersonagemState get initialState => PersonagemInitial();

  @override
  Stream<PersonagemState> mapEventToState(PersonagemEvent event) async* {
    if (event is SalvarPersonagem) {
      yield* this._mapSalvarPersonagemToState(nomePersonagem: event.nome);
    } else if (event is ObterPersonagem) {
      yield* this._mapObterPersonagemToState(idPersonagem: event.idPersonagem);
    } else if (event is ObterMeusPersonagens) {
      yield* this._mapObterMeusPersonagensToState(idUsuario: event.uid);
    } else if (event is ObterTodosPersonagens) {
      yield* this._mapObterTodosPersonagensToState();
    } else if (event is AtualizarPersonagem) {
      yield* this._mapAtualizarPersonagemToState(personagem: event.personagem);
    } else if (event is RemoverPersonagem) {
      yield* this._mapRemoverPersonagemToState(personagem: event.personagem);
    }
  }

  Stream<PersonagemState> _mapSalvarPersonagemToState({
    String nomePersonagem,
  }) async* {
    if (!(state is PersonagemCarregando)) {
      yield PersonagemCarregando();

      try {
        await _service.salvar(nomePersonagem);
        yield PersonagemSuccess();
      } catch (_) {
        yield PersonagemFailure(
          erro: "Erro ao cadastrar personagem.\nVerifique sua conexão.",
        );
      }
    }
  }

  Stream<PersonagemState> _mapObterPersonagemToState({
    String idPersonagem,
  }) async* {
    if (!(state is PersonagemCarregando)) {
      yield PersonagemCarregando();
      try {
        Personagem personagem = await _service.obterPersonagem(idPersonagem);
        yield PersonagemCarregado(personagem: personagem);
      } catch (e) {
        yield PersonagemFailure(
          erro: "Erro ao obter personagem.\nVerifique sua conexão.",
        );
      }
    }
  }

  Stream<PersonagemState> _mapObterMeusPersonagensToState({
    String idUsuario,
  }) async* {
    if (!(state is PersonagemCarregando)) {
      yield PersonagemCarregando();
      try {
        List<Personagem> personagens =
            await _service.obterPersonagensPor(idUsuario);
        yield PersonagensCarregado(personagens: personagens);
      } catch (e) {
        yield PersonagemFailure(
          erro: "Erro ao obter personagens.\nVerifique sua conexão.",
        );
      }
    }
  }

  Stream<PersonagemState> _mapObterTodosPersonagensToState({
    String uid,
  }) async* {
    if (!(state is PersonagemCarregando)) {
      yield PersonagemCarregando();
      try {
        List<Personagem> personagens = await _service.obterTodosPersonagens();

        yield PersonagensCarregado(personagens: personagens);
      } catch (e) {
        yield PersonagemFailure(
          erro: "Erro ao obter personagens.\nVerifique sua conexão.",
        );
      }
    }
  }

  Stream<PersonagemState> _mapAtualizarPersonagemToState({
    Personagem personagem,
  }) async* {
    if (!(state is PersonagemCarregando)) {
      yield PersonagemCarregando();

      try {
        await _service.atualizar(personagem);
        yield PersonagemAtualizado(mensagem: "Alterações salvas com sucesso!");
      } catch (_) {
        yield PersonagemFailure(
          erro: "Erro ao atualizar personagem.\nVerifique sua conexão.",
        );
      }
    }
  }

  Stream<PersonagemState> _mapRemoverPersonagemToState({
    Personagem personagem,
  }) async* {
    if (!(state is PersonagemCarregando)) {
      yield PersonagemCarregando();
      try {
        await _service.remover(personagem);
        yield PersonagemRemovido(mensagem: "Personagem removido com sucesso");
      } catch (e) {
        yield PersonagemFailure(
            erro: "Erro ao remover personagem.\nVerifique sua conexão.");
      }
    }
  }
}
