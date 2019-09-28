import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

/// Classe responsável pela representação de um evento de login.
@immutable
abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super(props);
}

/// Classe responsável por representar um evento de alteração no
/// campo de e-mail durante o login do usuário.
class EmailChanged extends LoginEvent {
  final String email;

  EmailChanged({@required this.email}) : super([email]);

  @override
  String toString() => 'EmailChanged { email: $email} ';
}

/// Classe responsável por representar um evento de alteração no
/// campo de senha durante o login do usuário.
class SenhaChanged extends LoginEvent {
  final String senha;

  SenhaChanged({@required this.senha}) : super([senha]);

  @override
  String toString() => 'SenhaChanged { senha: $senha }';
}

/// Classe responsável por representar um evento de submissão dos
/// campos e-mail e senha no login do usuário.
class Submitted extends LoginEvent {
  final String email;
  final String senha;

  Submitted({@required this.email, @required this.senha})
      : super([email, senha]);

  @override
  String toString() => 'Submitted { email: $email, senha: $senha }';
}

/// Classe responsável por representar um evento de login
/// realizado com as credênciais de e-mail e senha.
class LoginWithCredentialsPressed extends LoginEvent {
  final String email;
  final String senha;

  LoginWithCredentialsPressed({@required this.email, @required this.senha})
      : super([email, senha]);

  @override
  String toString() {
    return 'LoginWithCredentialsPressed { email: $email, senha: $senha }';
  }
}
