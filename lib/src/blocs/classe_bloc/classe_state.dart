import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:millenium/src/models/classe/classe.dart';

@immutable
abstract class ClasseState extends Equatable {
  @override
  List<Object> get props => [];
}

class ClasseInitial extends ClasseState {
  @override
  String toString() => 'ClasseInitial';
}

class ClasseCarregando extends ClasseState {
  @override
  String toString() => 'ClasseCarregando';
}

class ClasseSuccess extends ClasseState {
  final String mensagem;

  ClasseSuccess({this.mensagem});

  @override
  List<Object> get props => [mensagem];

  @override
  String toString() => 'ClasseSuccess';
}

class ClasseFailure extends ClasseState {
  final String erro;

  ClasseFailure({@required this.erro});

  @override
  List<Object> get props => [erro];

  @override
  String toString() => 'ClasseFailure';
}

class ClassesCarregadas extends ClasseState {
  final List<Classe> classes;

  ClassesCarregadas({@required this.classes});

  @override
  List<Object> get props => [classes];

  @override
  String toString() => 'ClassesCarregadas';
}
