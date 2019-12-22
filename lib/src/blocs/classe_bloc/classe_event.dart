import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class ClasseEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ObterClasses extends ClasseEvent {
  @override
  String toString() => 'ObterClasses';
}
