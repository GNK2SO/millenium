import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_event.dart';
import 'package:millenium/src/blocs/personagem_bloc/personagem_state.dart';
import 'package:millenium/src/models/atributos_combate/atributos_combate.dart';
import 'package:millenium/src/models/atributos_exploracao/atributos_exploracao.dart';
import 'package:millenium/src/models/personagem/personagem.dart';
import 'package:millenium/src/repository/personagem_repository.dart';

import 'personagem_state.dart';

class PersonagemBloc extends Bloc<PersonagemEvent, PersonagemState> {
  final PersonagemRepository _personagemRepository;

  PersonagemBloc({
    @required repository,
  })  : assert(repository != null),
        _personagemRepository = repository;

  @override
  PersonagemState get initialState => PersonagemInitial();

  @override
  Stream<PersonagemState> mapEventToState(PersonagemEvent event) async* {
    if (event is SalvarPersonagem) {
      yield* this._mapSalvarPersonagemToState(nomePersonagem: event.nome);
    } else if (event is ObterPersonagem) {
      yield* this._mapObterPersonagemToState(idPersonagem: event.idPersonagem);
    } else if (event is ObterMeusPersonagens) {
      yield* this._mapObterMeusPersonagensToState(uid: event.uid);
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
      final personagem = Personagem(
        nome: nomePersonagem,
        atributosCombate: AtributosCombate(),
        atributosExploracao: AtributosExploracao(),
      );
      try {
        await _personagemRepository.salvar(personagem);
        yield PersonagemSuccess();
      } catch (_) {
        yield PersonagemFailure(
            erro: "Erro ao cadastrar personagem.\nVerifique sua conexão.");
      }
    }
  }

  Stream<PersonagemState> _mapObterPersonagemToState({
    String idPersonagem,
  }) async* {
    if (!(state is PersonagemCarregando)) {
      yield PersonagemCarregando();
      try {
        DocumentSnapshot document =
            await _personagemRepository.obterPersonagem(idPersonagem);
        String data = json.encode(document.data);
        yield PersonagemCarregado(
            personagem: Personagem.fromJson(json.decode(data)));
      } catch (e) {
        yield PersonagemFailure(
            erro: "Erro ao cadastrar personagem.\nVerifique sua conexão.");
      }
    }
  }

  Stream<PersonagemState> _mapObterMeusPersonagensToState({
    String uid,
  }) async* {
    if (!(state is PersonagemCarregando)) {
      yield PersonagemCarregando();
      try {
        QuerySnapshot document =
            await _personagemRepository.obterMeusPersonagens(uid);

        yield PersonagensCarregado(
          personagens: mapToList(documents: document.documents),
        );
      } catch (e) {
        yield PersonagemFailure(
            erro: "Erro ao cadastrar personagem.\nVerifique sua conexão.");
      }
    }
  }

  Stream<PersonagemState> _mapObterTodosPersonagensToState({
    String uid,
  }) async* {
    if (!(state is PersonagemCarregando)) {
      yield PersonagemCarregando();
      try {
        QuerySnapshot document =
            await _personagemRepository.obterTodosPersonagens();

        yield PersonagensCarregado(
          personagens: mapToList(documents: document.documents),
        );
      } catch (e) {
        yield PersonagemFailure(
            erro: "Erro ao cadastrar personagem.\nVerifique sua conexão.");
      }
    }
  }

  Stream<PersonagemState> _mapAtualizarPersonagemToState({
    Personagem personagem,
  }) async* {
    if (!(state is PersonagemCarregando)) {
      yield PersonagemCarregando();

      try {
        await _personagemRepository.atualizar(personagem);
        yield PersonagemSuccess(
          mensagem: "Alterações salvas com sucesso!",
        );
      } catch (_) {
        yield PersonagemFailure(
            erro: "Erro ao atualizar personagem.\nVerifique sua conexão.");
      }
    }
  }

  Stream<PersonagemState> _mapRemoverPersonagemToState({
    Personagem personagem,
  }) async* {
    if (!(state is PersonagemCarregando)) {
      yield PersonagemCarregando();
      try {
        await _personagemRepository.remover(personagem);
        yield PersonagemRemovido(mensagem: "Personagem removido com sucesso");
      } catch (e) {
        yield PersonagemFailure(
            erro: "Erro ao remover personagem.\nVerifique sua conexão.");
      }
    }
  }

  List<Personagem> mapToList({List<DocumentSnapshot> documents}) {
    List<Personagem> personagens = [];
    if (documents != null) {
      documents.forEach((document) {
        String jsonData = json.encode(document.data);
        personagens.add(Personagem.fromJson(json.decode(jsonData)));
      });
    }
    return personagens;
  }
}
