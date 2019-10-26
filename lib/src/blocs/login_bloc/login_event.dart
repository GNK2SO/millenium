import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super(props);
}

class Autenticar extends LoginEvent {
  final String email;
  final String senha;

  Autenticar({@required this.email, @required this.senha})
      : super([email, senha]);

  @override
  String toString() => 'Autenticar { email: $email }';
}
