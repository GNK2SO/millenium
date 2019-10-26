mixin UsuarioValidator {
  String isValidNome(String nome) {
    if (nome.isEmpty || nome == null) {
      return ("Campo obrigatório!");
    }
    return null;
  }

  String isValidEmail(email) {
    final regExp = RegExp(r"^[a-zA-Z0-9]{3,61}@millenium.com$");
    if (email.isEmpty) {
      return "Campo obrigatório!";
    } else if (!regExp.hasMatch(email)) {
      return "E-mail inválido!";
    } else {
      return null;
    }
  }

  String isValidSenha(senha) {
    final regExp = RegExp(r"^[a-zA-Z0-9]{6,16}$");
    if (senha.isEmpty) {
      return "Campo obrigatório!";
    } else if (senha.length < 6 || senha.length > 16) {
      return "Tamanho entre 6 a 16 caracteres!";
    } else if (!regExp.hasMatch(senha)) {
      return "Senha não deve conter caracteres especiais!";
    } else {
      return null;
    }
  }
}
