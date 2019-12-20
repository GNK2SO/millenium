import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:millenium/src/models/besta/besta.dart';

@immutable
abstract class BestiarioState extends Equatable {
  @override
  List<Object> get props => [];
}

class BestiarioInitial extends BestiarioState {
  @override
  String toString() => 'BestiarioInitial';
}

class BestiarioCarregando extends BestiarioState {
  @override
  String toString() => 'BestiarioCarregando';
}

class BestiarioSuccess extends BestiarioState {
  final String mensagem;

  BestiarioSuccess({this.mensagem});

  @override
  List<Object> get props => [mensagem];

  @override
  String toString() => 'BestiarioSuccess';
}

class BestiarioFailure extends BestiarioState {
  final String erro;

  BestiarioFailure({@required this.erro});

  @override
  List<Object> get props => [erro];

  @override
  String toString() => 'BestiarioFailure';
}

class BestiarioCarregado extends BestiarioState {
  final List<Besta> bestiario;

  BestiarioCarregado({@required this.bestiario});

  @override
  List<Object> get props => [bestiario];

  @override
  String toString() => 'BestiarioCarregado';
}
