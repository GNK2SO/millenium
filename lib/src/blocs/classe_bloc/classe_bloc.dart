import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:millenium/src/blocs/classe_bloc/classe_event.dart';
import 'package:millenium/src/blocs/classe_bloc/classe_state.dart';
import 'package:millenium/src/models/classe/classe.dart';
import 'package:millenium/src/service/classe_service.dart';

class ClasseBloc extends Bloc<ClasseEvent, ClasseState> {
  final ClasseService _classeService;

  ClasseBloc({
    @required repository,
  })  : assert(repository != null),
        _classeService = repository;

  @override
  ClasseState get initialState => ClasseInitial();

  @override
  Stream<ClasseState> mapEventToState(ClasseEvent event) async* {
    if (event is ObterClasses) {
      yield* this._mapObterClassesToState();
    } else if (event is ObterClasse) {
      yield* this._mapObterClasseToState(nomeClasse: event.nome);
    }
  }

  Stream<ClasseState> _mapObterClassesToState({
    String uid,
  }) async* {
    if (!(state is ClasseCarregando)) {
      yield ClasseCarregando();
      try {
        List<Classe> classes = await _classeService.obterClasses();

        yield ClassesCarregadas(classes: classes);
      } catch (e) {
        yield ClasseFailure(
            erro: "Erro ao obter classes.\nVerifique sua conexão.");
      }
    }
  }

  Stream<ClasseState> _mapObterClasseToState({String nomeClasse}) async* {
    if (!(state is ClasseCarregando)) {
      yield ClasseCarregando();
      try {
        Classe classe = await _classeService.obterClasse(nomeClasse);
        yield ClasseCarregada(classe: classe);
      } catch (e) {
        yield ClasseFailure(
            erro: "Erro ao obter classe: $nomeClasse.\nVerifique sua conexão.");
      }
    }
  }
}
