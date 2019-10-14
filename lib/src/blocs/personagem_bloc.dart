import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:millenium/src/models/atributos_combate.dart';
import 'package:millenium/src/models/atributos_exploracao.dart';
import 'package:millenium/src/models/page_state.dart';
import 'package:millenium/src/models/personagem.dart';
import 'package:millenium/src/models/page_state_info.dart';
import 'package:millenium/src/repository/personagem_repository.dart';
import 'package:rxdart/rxdart.dart';

class PersonagemBloc extends BlocBase {
  final PersonagemRepository _personagemRepository = PersonagemRepository();

  //Controllers
  final _nomeController = BehaviorSubject<String>();
  final _stateController = BehaviorSubject<PageStateInfo>.seeded(
    PageStateInfo(
      state: PageState.SCREEN,
    ),
  );

  //Streams
  Stream<String> get nomeStream => _nomeController.stream;
  Stream<PageStateInfo> get stateStream => _stateController.stream;

  //Sinks
  Sink<String> get nomeSink => _nomeController.sink;
  Sink<PageStateInfo> get stateSink => _stateController.sink;

  void salvarPersonagem() async {
    stateSink.add(PageStateInfo(state: PageState.LOADING));
    final personagem = Personagem(
      nome: _nomeController.value,
      atributosCombate: AtributosCombate(),
      atributosExploracao: AtributosExploracao(),
    );
    try {
      await _personagemRepository.salvar(personagem);
      stateSink.add(PageStateInfo(state: PageState.SUCCESS));
    } catch (_) {
      stateSink.add(
        PageStateInfo(
          state: PageState.LOADING,
          message: "Falha ao criar personagem.\nVerifique sua conexao.",
        ),
      );
    }
  }

  Stream<QuerySnapshot> obterTodosPersonagens(String uid) {
    return _personagemRepository.obterTodosPersonagens(uid);
  }

  Stream<DocumentSnapshot> obterPersonagem(String uid, String nome) {
    return _personagemRepository.obterPersonagem(uid, nome);
  }

  void atualizar(Personagem personagem) async {
    stateSink.add(PageStateInfo(state: PageState.LOADING));
    try {
      await _personagemRepository.atualizar(personagem);
      stateSink.add(PageStateInfo(
        state: PageState.SUCCESS,
        message: "Alterações salvas com sucesso.",
      ));
    } catch (_) {
      stateSink.add(
        PageStateInfo(
          state: PageState.FAILED,
          message: "Falha ao fazer alterações.\nVerifique sua conexao.",
        ),
      );
    }
  }

  void remover(Personagem personagem) async {
    try {
      await _personagemRepository.remover(personagem);
      stateSink.add(PageStateInfo(
        state: PageState.SUCCESS,
        message: "Personagem removido com sucesso.",
      ));
    } catch (_) {
      stateSink.add(
        PageStateInfo(
          state: PageState.FAILED,
          message: "Falha ao remover personagem.\nVerifique sua conexao.",
        ),
      );
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

  @override
  void dispose() {
    _nomeController.close();
    _stateController.close();
    super.dispose();
  }
}
