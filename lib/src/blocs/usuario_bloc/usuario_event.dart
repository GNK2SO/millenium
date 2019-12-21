import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:millenium/src/models/usuario.dart';

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

class AtualizarUsuario extends UsuarioEvent {
  final Usuario usuario;

  AtualizarUsuario({@required this.usuario});

  @override
  List<Object> get props => [usuario];

  @override
  String toString() => 'AtualizarUsuario';
}