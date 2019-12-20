import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class UsuarioEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SalvarUsuario extends UsuarioEvent {
  final String nome;
  final String email;
  final String senha;

  SalvarUsuario({@required this.nome, @required this.email, @required this.senha});

  @override
  List<Object> get props => [nome, email, senha];

  @override
  String toString() => 'SalvarUsuario { nome: $nome, email: $email }';
}
