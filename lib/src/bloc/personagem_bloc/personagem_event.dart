import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:millenium/src/models/atributos.dart';

@immutable
abstract class PersonagemEvent extends Equatable {
  PersonagemEvent([List props = const []]) : super([props]);
}

class FormSubmitted extends PersonagemEvent {
  final String nome;
  final String idUsuario;
  final Atributos atributos;

  FormSubmitted({
    @required this.nome,
    @required this.idUsuario,
    @required this.atributos,
  }) : super([nome, idUsuario, atributos]);

  @override
  String toString() => '''
    FormSubmitted
    {
      nome: $nome,
      atributos: $atributos
    }
  ''';
}
