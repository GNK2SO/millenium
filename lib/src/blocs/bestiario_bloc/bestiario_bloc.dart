import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:millenium/src/blocs/bestiario_bloc/bestiario_event.dart';
import 'package:millenium/src/blocs/bestiario_bloc/bestiario_state.dart';
import 'package:millenium/src/models/besta/besta.dart';
import 'package:millenium/src/service/bestiario_service.dart';

class BestiarioBloc extends Bloc<BestiarioEvent, BestiarioState> {
  final BestiarioService _service;

  BestiarioBloc({
    @required repository,
  })  : assert(repository != null),
        _service = repository;

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
      try {
        await _service.salvar(nomeBesta);
        yield BestiarioSuccess();
      } catch (_) {
        yield BestiarioFailure(
          erro: "Erro ao cadastrar besta.\nVerifique sua conexão.",
        );
      }
    }
  }

  Stream<BestiarioState> _mapObterBestiarioToState({
    String uid,
  }) async* {
    if (!(state is BestiarioCarregando)) {
      yield BestiarioCarregando();
      try {
        List<Besta> bestiario = await _service.obterBestiario();
        yield BestiarioCarregado(bestiario: bestiario);
      } catch (e) {
        yield BestiarioFailure(
          erro: "Erro ao obter bestiário.\nVerifique sua conexão.",
        );
      }
    }
  }

  Stream<BestiarioState> _mapAtualizarBestaToState({
    Besta besta,
  }) async* {
    if (!(state is BestiarioCarregando)) {
      yield BestiarioCarregando();

      try {
        await _service.atualizar(besta);
        yield BestiarioSuccess(
          mensagem: "Alterações salvas com sucesso!",
        );
      } catch (_) {
        yield BestiarioFailure(
          erro: "Erro ao atualizar besta.\nVerifique sua conexão.",
        );
      }
    }
  }

  Stream<BestiarioState> _mapRemoverBestaToState({
    Besta besta,
  }) async* {
    if (!(state is BestiarioCarregando)) {
      yield BestiarioCarregando();
      try {
        await _service.remover(besta);
        yield BestiarioSuccess(mensagem: "Besta removido com sucesso");
      } catch (e) {
        yield BestiarioFailure(
          erro: "Erro ao remover besta.\nVerifique sua conexão.",
        );
      }
    }
  }
}
