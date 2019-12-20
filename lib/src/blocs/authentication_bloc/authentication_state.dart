import 'package:equatable/equatable.dart';
import 'package:millenium/src/models/usuario.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthenticationState {
  @override
  String toString() => 'Uninitialized';
}

class Authenticated extends AuthenticationState {
  final Usuario usuario;

  Authenticated(this.usuario);

  @override
  List<Object> get props => [usuario];

  @override
  String toString() => 'Authenticated { email: ${usuario.email} }';
}

class Unauthenticated extends AuthenticationState {
  @override
  String toString() => 'Unauthenticated';
}
