import 'package:meta/meta.dart';

@immutable
class PersonagemState {
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  PersonagemState({
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
  });

  factory PersonagemState.empty() {
    return PersonagemState(
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory PersonagemState.loading() {
    return PersonagemState(
        isSubmitting: true, isSuccess: false, isFailure: false);
  }

  factory PersonagemState.failure() {
    return PersonagemState(
        isSubmitting: false, isSuccess: false, isFailure: true);
  }

  factory PersonagemState.success() {
    return PersonagemState(
        isSubmitting: false, isSuccess: true, isFailure: false);
  }

  PersonagemState copyWith({
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
  }) {
    return PersonagemState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }
}
