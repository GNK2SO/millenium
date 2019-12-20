import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:millenium/src/blocs/bestiario_bloc/bestiario_event.dart';
import 'package:millenium/src/blocs/bestiario_bloc/bestiario_state.dart';
import 'package:millenium/src/models/besta/besta.dart';
import 'package:millenium/src/repository/bestiario_repository.dart';

class BestiarioBloc extends Bloc<BestiarioEvent, BestiarioState> {
  final BestiarioRepository _bestiarioRepository;

  BestiarioBloc({
    @required repository,
  })  : assert(repository != null),
        _bestiarioRepository = repository;

  @override
  BestiarioState get initialState => BestiarioInitial();

  @override
  Stream<BestiarioState> mapEventToState(BestiarioEvent event) async* {
    if (event is SalvarBesta) {
      yield* this._mapSalvarBestaToState(nomeBesta: event.nome);
    } else if (event is ObterBestiario) {
      yield* this._mapObterBestiarioToState();
    } else if (event is AtualizarBesta) {
      yield* this._mapAtualizarBestaToState(besta: event.besta);
    } else if (event is RemoverBesta) {
      yield* this._mapRemoverBestaToState(besta: event.besta);
    }
  }

  Stream<BestiarioState> _mapSalvarBestaToState({
    String nomeBesta,
  }) async* {
    if (!(state is BestiarioCarregando)) {
      yield BestiarioCarregando();
      final besta = Besta(
        nome: nomeBesta,
      );
      try {
        await _bestiarioRepository.salvar(besta);
        yield BestiarioSuccess();
      } catch (_) {
        yield BestiarioFailure(erro: "Erro ao cadastrar besta.\nVerifique sua conexão.");
      }
    }
  }

  Stream<BestiarioState> _mapObterBestiarioToState({
    String uid,
  }) async* {
    if (!(state is BestiarioCarregando)) {
      yield BestiarioCarregando();
      try {
        QuerySnapshot document = await _bestiarioRepository.obterBestiario();

        yield BestiarioCarregado(
          bestiario: mapToList(documents: document.documents),
        );
      } catch (e) {
        yield BestiarioFailure(erro: "Erro ao obter bestiário.\nVerifique sua conexão.");
      }
    }
  }

  Stream<BestiarioState> _mapAtualizarBestaToState({
    Besta besta,
  }) async* {
    if (!(state is BestiarioCarregando)) {
      yield BestiarioCarregando();

      try {
        await _bestiarioRepository.atualizar(besta);
        yield BestiarioSuccess(
          mensagem: "Alterações salvas com sucesso!",
        );
      } catch (_) {
        yield BestiarioFailure(erro: "Erro ao atualizar besta.\nVerifique sua conexão.");
      }
    }
  }

  Stream<BestiarioState> _mapRemoverBestaToState({
    Besta besta,
  }) async* {
    if (!(state is BestiarioCarregando)) {
      yield BestiarioCarregando();
      try {
        await _bestiarioRepository.remover(besta);
        yield BestiarioSuccess(mensagem: "Besta removido com sucesso");
      } catch (e) {
        yield BestiarioFailure(erro: "Erro ao remover besta.\nVerifique sua conexão.");
      }
    }
  }

  List<Besta> mapToList({List<DocumentSnapshot> documents}) {
    List<Besta> personagens = [];
    if (documents != null) {
      documents.forEach((document) {
        String jsonData = json.encode(document.data);
        personagens.add(Besta.fromJson(json.decode(jsonData)));
      });
    }
    return personagens;
  }
}
