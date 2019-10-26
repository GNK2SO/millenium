import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class CadastroEvent extends Equatable {
  CadastroEvent([List props = const []]) : super(props);
}

class SalvarUsuario extends CadastroEvent {
  final String nome;
  final String email;
  final String senha;

  SalvarUsuario({@required this.nome, @required this.email, @required this.senha})
      : super([nome, email, senha]);

  @override
  String toString() => 'SalvarUsuario { nome: $nome, email: $email }';
}
