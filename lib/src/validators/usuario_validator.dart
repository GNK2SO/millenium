mixin UsuarioValidator {
  String isValidNome(String nome) {
    if (nome.isEmpty) {
      return "Campo obrigatório!";
    } else if (nome.length < 3 || nome.length > 16) {
      return "Tamanho de 3 a 16 caracteres!";
    } else {
      return null;
    }
  }

  String isValidEmail(String email) {
    final regExp =
        RegExp(r"^[a-zA-Z0-9]{3,61}@[a-zA-Z0-9]{3,61}.[a-zA-Z0-9]{3,61}$");
    if (email.isEmpty) {
      return "Campo obrigatório!";
    } else if (!regExp.hasMatch(email)) {
      return "E-mail inválido!";
    } else {
      return null;
    }
  }

  String isValidSenha(String password) {
    final regExp = RegExp(r"^[a-zA-Z0-9]{6,16}$");
    if (password.isEmpty) {
      return "Campo obrigatório!";
    } else if (password.length < 6 || password.length > 16) {
      return "Tamanho de 6 a 16 caracteres!";
    } else if (!regExp.hasMatch(password)) {
      return "Senha não deve conter caracteres especiais!";
    } else {
      return null;
    }
  }
}
