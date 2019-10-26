import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:millenium/src/models/usuario.dart';

@immutable
abstract class CadastroState extends Equatable {
  CadastroState([List props = const []]) : super(props);
}

class Screen extends CadastroState {
  @override
  String toString() => 'Screen';
}

class Loading extends CadastroState {
  @override
  String toString() => 'Loading';
}

class Success extends CadastroState {
  final Usuario usuario;

  Success({@required this.usuario}) : super([usuario]);

  @override
  String toString() => 'Success';
}

class Failure extends CadastroState {
  final String erro;

  Failure({@required this.erro}) : super([erro]);

  @override
  String toString() => 'Failure';
}
