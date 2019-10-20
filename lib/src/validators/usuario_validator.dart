import 'dart:async';

mixin UsuarioValidator {
  final isValidNome = StreamTransformer<String, String>.fromHandlers(
    handleData: (nome, sink) {
      if (nome.isEmpty) {
        sink.addError("Campo obrigatório!");
      } else {
        sink.add(nome);
      }
    },
  );

  final isValidEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      final regExp = RegExp(r"^[a-zA-Z0-9]{3,61}@millenium.com$");
      if (email.isEmpty) {
        sink.addError("Campo obrigatório!");
      } else if (!regExp.hasMatch(email)) {
        sink.addError("E-mail inválido!");
      } else {
        sink.add(email);
      }
    },
  );

  final isValidSenha =
      StreamTransformer<String, String>.fromHandlers(handleData: (senha, sink) {
    final regExp = RegExp(r"^[a-zA-Z0-9]{1,16}$");
    if (senha.isEmpty) {
      sink.addError("Campo obrigatório!");
    } else if (!regExp.hasMatch(senha)) {
      sink.addError("Senha não deve conter caracteres especiais!");
    } else {
      sink.add(senha);
    }
  });
}
