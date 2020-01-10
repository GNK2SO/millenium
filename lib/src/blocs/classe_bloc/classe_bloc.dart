import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:millenium/src/blocs/classe_bloc/classe_event.dart';
import 'package:millenium/src/blocs/classe_bloc/classe_state.dart';
import 'package:millenium/src/models/classe/classe.dart';
import 'package:millenium/src/repository/classe_repository.dart';

class ClasseBloc extends Bloc<ClasseEvent, ClasseState> {
  final ClasseRepository _classeRepository;

  ClasseBloc({
    @required repository,
  })  : assert(repository != null),
        _classeRepository = repository;

  @override
  ClasseState get initialState => ClasseInitial();

  @override
  Stream<ClasseState> mapEventToState(ClasseEvent event) async* {
    if (event is ObterClasses) {
      yield* this._mapObterClassesToState();
    }
  }

  Stream<ClasseState> _mapObterClassesToState({
    String uid,
  }) async* {
    if (!(state is ClasseCarregando)) {
      yield ClasseCarregando();
      try {
        QuerySnapshot classes = await _classeRepository.obterClasses();

        yield ClassesCarregadas(
          classes: mapToList(documents: classes.documents),
        );
      } catch (e) {
        yield ClasseFailure(
            erro: "Erro ao obter classes.\nVerifique sua conexão.");
      }
    }
  }

  List<Classe> mapToList({List<DocumentSnapshot> documents}) {
    List<Classe> classes = [];
    if (documents != null) {
      documents.forEach((document) {
        String jsonData = json.encode(document.data);
        classes.add(Classe.fromJson(json.decode(jsonData)));
      });
    }
    return classes;
  }
}
