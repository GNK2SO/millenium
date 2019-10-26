import 'package:equatable/equatable.dart';
import 'package:millenium/src/models/usuario.dart';

abstract class AuthenticationState extends Equatable {
  AuthenticationState([List props = const []]) : super(props);
}

class Uninitialized extends AuthenticationState {
  @override
  String toString() => 'Uninitialized';
}

class Authenticated extends AuthenticationState {
  final Usuario usuario;

  Authenticated(this.usuario) : super([usuario]);

  @override
  String toString() => 'Authenticated { email: ${usuario.email} }';
}

class Unauthenticated extends AuthenticationState {
  @override
  String toString() => 'Unauthenticated';
}
