import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:millenium/src/models/besta/besta.dart';

@immutable
abstract class BestiarioEvent extends Equatable {
  BestiarioEvent([List props = const []]) : super(props);
}

class ObterBestiario extends BestiarioEvent {
  @override
  String toString() => 'ObterBestiario';
}

class SalvarBesta extends BestiarioEvent {
  final String nome;
  final String imagem;
  final String descricao;
  final List<String> localizacao;
  final int nivel;

  SalvarBesta({
    @required this.nome,
    @required this.imagem,
    @required this.descricao,
    @required this.localizacao,
    @required this.nivel,
  }) : super([nome]);

  @override
  String toString() =>
      'SalvarBesta { nome: $nome, Nv.$int, localizacao: $localizacao }';
}

class AtualizarBesta extends BestiarioEvent {
  final Besta besta;

  AtualizarBesta({@required this.besta}) : super([besta]);

  @override
  String toString() => 'AtualizarBesta { nome: ${besta.nome} }';
}

class RemoverBesta extends BestiarioEvent {
  final Besta besta;

  RemoverBesta({@required this.besta}) : super([besta]);

  @override
  String toString() => 'RemoverBesta { nome: ${besta.nome} }';
}
