import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:millenium/src/models/personagem.dart';

@immutable
abstract class PersonagemState extends Equatable {
  PersonagemState([List props = const []]) : super(props);
}

class Screen extends PersonagemState {
  @override
  String toString() => 'Screen';
}

class Loading extends PersonagemState {
  @override
  String toString() => 'Loading';
}

class PersonagemLoaded extends PersonagemState {
  final Personagem personagem;

  PersonagemLoaded({@required this.personagem}) : super([personagem]);

  @override
  String toString() => 'PersonagemLoaded';
}

class PersonagensLoaded extends PersonagemState {
  final List<Personagem> personagens;

  PersonagensLoaded({@required this.personagens}) : super([personagens]);

  @override
  String toString() => 'PersonagensLoaded';
}

class Success extends PersonagemState {
  final String mensagem;

  Success({this.mensagem: ""}) : super([mensagem]);

  @override
  String toString() => 'Success';
}

class Failure extends PersonagemState {
  final String erro;

  Failure({@required this.erro}) : super([erro]);

  @override
  String toString() => 'Failure';
}
