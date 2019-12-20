import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:millenium/src/models/personagem/personagem.dart';

@immutable
abstract class PersonagemEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ObterPersonagem extends PersonagemEvent {
  final String idPersonagem;

  ObterPersonagem({@required this.idPersonagem});

  @override
  List<Object> get props => [this.idPersonagem];

  @override
  String toString() => 'ObterPersonagem { id: $idPersonagem }';
}

class ObterMeusPersonagens extends PersonagemEvent {
  final String uid;

  ObterMeusPersonagens({@required this.uid});

  @override
  List<Object> get props => [this.uid];

  @override
  String toString() => 'ObterMeusPersonagens { uid: $uid }';
}

class ObterTodosPersonagens extends PersonagemEvent {
  @override
  String toString() => 'ObterTodosPersonagens';
}

class SalvarPersonagem extends PersonagemEvent {
  final String nome;

  SalvarPersonagem({@required this.nome});

  @override
  List<Object> get props => [this.nome];

  @override
  String toString() => 'SalvarPersonagem { nome: $nome }';
}

class AtualizarPersonagem extends PersonagemEvent {
  final Personagem personagem;

  AtualizarPersonagem({@required this.personagem});

  @override
  List<Object> get props => [this.personagem];

  @override
  String toString() => 'AtualizarPersonagem { nome: ${personagem.nome} }';
}

class RemoverPersonagem extends PersonagemEvent {
  final Personagem personagem;

  RemoverPersonagem({@required this.personagem});

  @override
  List<Object> get props => [this.personagem];

  @override
  String toString() => 'RemoverPersonagem { nome: ${personagem.nome} }';
}
