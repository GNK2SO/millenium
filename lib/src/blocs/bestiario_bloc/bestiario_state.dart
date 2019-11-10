import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:millenium/src/models/besta/besta.dart';

@immutable
abstract class BestiarioState extends Equatable {
  BestiarioState([List props = const []]) : super(props);
}

class Screen extends BestiarioState {
  @override
  String toString() => 'Screen';
}

class Loading extends BestiarioState {
  @override
  String toString() => 'Loading';
}

class Success extends BestiarioState {
  final String mensagem;

  Success({this.mensagem}) : super([mensagem]);

  @override
  String toString() => 'Success';
}

class Failure extends BestiarioState {
  final String erro;

  Failure({@required this.erro}) : super([erro]);

  @override
  String toString() => 'Failure';
}

class BestiarioLoaded extends BestiarioState {
  final List<Besta> bestiario;

  BestiarioLoaded({@required this.bestiario}) : super([bestiario]);

  @override
  String toString() => 'BestiarioLoaded';
}
