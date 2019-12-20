import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Autenticar extends LoginEvent {
  final String email;
  final String senha;

  Autenticar({@required this.email, @required this.senha});

  @override
  List<Object> get props => [this.email, this.senha];

  @override
  String toString() => 'Autenticar { email: $email }';
}
