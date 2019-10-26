import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:millenium/src/models/usuario.dart';

@immutable
abstract class LoginState extends Equatable {
  LoginState([List props = const []]) : super(props);
}

class Screen extends LoginState {
  @override
  String toString() => 'Screen';
}

class Loading extends LoginState {
  @override
  String toString() => 'Loading';
}

class Success extends LoginState {
  final Usuario usuario;

  Success({@required this.usuario}) : super([usuario]);

  @override
  String toString() => 'Success';
}

class Failure extends LoginState {
  final String erro;

  Failure({@required this.erro}) : super([erro]);

  @override
  String toString() => 'Failure';
}
