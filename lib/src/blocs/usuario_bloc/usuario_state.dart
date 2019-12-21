import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:millenium/src/models/usuario.dart';

@immutable
abstract class UsuarioState extends Equatable {
  @override
  List<Object> get props => [];
}

class UsuarioInitial extends UsuarioState {
  @override
  String toString() => 'UsuarioInitial';
}

class UsuarioCarregando extends UsuarioState {
  @override
  String toString() => 'UsuarioCarregando';
}

class UsuarioAtualizado extends UsuarioState {
  final Usuario usuario;

  UsuarioAtualizado({@required this.usuario});

  @override
  List<Object> get props => [usuario];

  @override
  String toString() => 'UsuarioAtualizado';
}

class UsuarioSuccess extends UsuarioState {
  final Usuario usuario;

  UsuarioSuccess({@required this.usuario});

  @override
  List<Object> get props => [this.usuario];

  @override
  String toString() => 'UsuarioSuccess';
}

class UsuarioFailure extends UsuarioState {
  final String erro;

  UsuarioFailure({@required this.erro});

  @override
  List<Object> get props => [this.erro];

  @override
  String toString() => 'UsuarioFailure';
}
