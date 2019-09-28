import 'package:meta/meta.dart';

/// Classe responsável por representar os estados de um login da aplicação.
@immutable
class LoginState {
  final bool isEmailValid;
  final bool isSenhaValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  LoginState(
      {@required this.isEmailValid,
      @required this.isSenhaValid,
      @required this.isSubmitting,
      @required this.isSuccess,
      @required this.isFailure});

  /// Factory method do estado inical do Login.
  factory LoginState.empty() {
    return LoginState(
      isEmailValid: false,
      isSenhaValid: false,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  /// Factory method do estado em carregamento do Login
  factory LoginState.loading() {
    return LoginState(
        isEmailValid: true,
        isSenhaValid: true,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false);
  }

  /// Factory method do estado de falha do Login
  factory LoginState.failure() {
    return LoginState(
        isEmailValid: true,
        isSenhaValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: true);
  }

  /// Factory method do estado de sucesso do Login
  factory LoginState.success() {
    return LoginState(
        isEmailValid: true,
        isSenhaValid: true,
        isSubmitting: false,
        isSuccess: true,
        isFailure: false);
  }

  /// Atualiza os atributos referentes as validações de e-mail e senha do usuário.
  LoginState update({bool isEmailValid, bool isSenhaValid}) {
    return copyWith(
        isEmailValid: isEmailValid,
        isSenhaValid: isSenhaValid,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false);
  }

  /// Atualiza os atributos do estado do usuário. Caso o atributo seja nulo, o mesmo
  /// não é alterado.
  LoginState copyWith({
    bool isEmailValid,
    bool isSenhaValid,
    bool isSubmitEnabled,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
  }) {
    return LoginState(
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isSenhaValid: isSenhaValid ?? this.isSenhaValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }
}
