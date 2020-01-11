import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class ClasseEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ObterClasses extends ClasseEvent {
  @override
  String toString() => 'ObterClasses';
}

class ObterClasse extends ClasseEvent {
  final String nome;

  ObterClasse({@required this.nome});

  @override
  List<Object> get props => [this.nome];

  @override
  String toString() => 'ObterClasses { nome: $nome }';
}
