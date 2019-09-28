import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CadastroUsuarioEvent extends Equatable {
  CadastroUsuarioEvent([List props = const []]) : super([props]);
}

class FormSubmitted extends CadastroUsuarioEvent {
  final String nome;
  final String email;
  final String senha;

  FormSubmitted({
    @required this.email,
    @required this.senha,
    @required this.nome,
  }) : super([
          nome,
          email,
          senha,
        ]);

  @override
  String toString() =>
      'FormSubmitted { nome: $nome, email: $email, senha: $senha }';
}
