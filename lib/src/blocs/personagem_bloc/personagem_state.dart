import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:millenium/src/models/personagem/personagem.dart';

@immutable
abstract class PersonagemState extends Equatable {
  @override
  List<Object> get props => [];
}

class PersonagemInitial extends PersonagemState {
  @override
  String toString() => 'PersonagemInitial';
}

class PersonagemCarregando extends PersonagemState {
  @override
  String toString() => 'PersonagemCarregando';
}

class PersonagemCarregado extends PersonagemState {
  final Personagem personagem;

  PersonagemCarregado({@required this.personagem});

  @override
  List<Object> get props => [this.personagem];

  @override
  String toString() => 'PersonagemCarregado';
}

class PersonagensCarregado extends PersonagemState {
  final List<Personagem> personagens;

  PersonagensCarregado({@required this.personagens});

  @override
  List<Object> get props => [this.personagens];

  @override
  String toString() => 'PersonagensCarregado';
}

class PersonagemRemovido extends PersonagemState {
  final String mensagem;

  PersonagemRemovido({@required this.mensagem});

  @override
  List<Object> get props => [this.mensagem];

  @override
  String toString() => 'PersonagemRemovido';
}

class Success extends PersonagemState {
  final String mensagem;

  Success({this.mensagem: ""});

  @override
  List<Object> get props => [this.mensagem];

  @override
  String toString() => 'Success';
}

class Failure extends PersonagemState {
  final String erro;

  Failure({@required this.erro});

  @override
  List<Object> get props => [this.erro];

  @override
  String toString() => 'Failure';
}
