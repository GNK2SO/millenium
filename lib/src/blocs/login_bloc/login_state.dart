import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:millenium/src/models/usuario.dart';

@immutable
abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  @override
  String toString() => 'LoginInitial';
}

class LoginCarregando extends LoginState {
  @override
  String toString() => 'LoginCarregando';
}

class LoginSuccess extends LoginState {
  final Usuario usuario;

  LoginSuccess({@required this.usuario});

  @override
  List<Object> get props => [this.usuario];

  @override
  String toString() => 'LoginSuccess';
}

class LoginFailure extends LoginState {
  final String erro;

  LoginFailure({@required this.erro});

  @override
  List<Object> get props => [this.erro];

  @override
  String toString() => 'LoginFailure';
}
