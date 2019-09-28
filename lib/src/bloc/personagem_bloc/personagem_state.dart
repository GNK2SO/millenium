import 'package:meta/meta.dart';

@immutable
class CadastroUsuarioState {
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  CadastroUsuarioState({
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
  });

  factory CadastroUsuarioState.empty() {
    return CadastroUsuarioState(
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory CadastroUsuarioState.loading() {
    return CadastroUsuarioState(
        isSubmitting: true, isSuccess: false, isFailure: false);
  }

  factory CadastroUsuarioState.failure() {
    return CadastroUsuarioState(
        isSubmitting: false, isSuccess: false, isFailure: true);
  }

  factory CadastroUsuarioState.success() {
    return CadastroUsuarioState(
        isSubmitting: false, isSuccess: true, isFailure: false);
  }

  CadastroUsuarioState copyWith({
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
  }) {
    return CadastroUsuarioState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }
}
