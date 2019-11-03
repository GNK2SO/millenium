import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:millenium/src/models/personagem/personagem.dart';

@immutable
abstract class PersonagemEvent extends Equatable {
  PersonagemEvent([List props = const []]) : super(props);
}

class ObterPersonagem extends PersonagemEvent {
  final String idPersonagem;

  ObterPersonagem({@required this.idPersonagem}) : super([idPersonagem]);

  @override
  String toString() => 'ObterPersonagem { id: $idPersonagem }';
}

class ObterMeusPersonagens extends PersonagemEvent {
  final String uid;

  ObterMeusPersonagens({@required this.uid}) : super([uid]);

  @override
  String toString() => 'ObterMeusPersonagens { uid: $uid }';
}

class ObterTodosPersonagens extends PersonagemEvent {
  @override
  String toString() => 'ObterTodosPersonagens';
}

class SalvarPersonagem extends PersonagemEvent {
  final String nome;

  SalvarPersonagem({@required this.nome}) : super([nome]);

  @override
  String toString() => 'SalvarPersonagem { nome: $nome }';
}

class AtualizarPersonagem extends PersonagemEvent {
  final Personagem personagem;

  AtualizarPersonagem({@required this.personagem}) : super([personagem]);

  @override
  String toString() => 'AtualizarPersonagem { nome: ${personagem.nome} }';
}

class RemoverPersonagem extends PersonagemEvent {
  final Personagem personagem;

  RemoverPersonagem({@required this.personagem}) : super([personagem]);

  @override
  String toString() => 'RemoverPersonagem { nome: ${personagem.nome} }';
}
