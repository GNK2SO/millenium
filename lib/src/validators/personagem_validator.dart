class PersonagemValidator {
  String isValidTitulo(String tituloPersonagen) {
    if (tituloPersonagen == null) {
      return "Campo obrigatório!";
    }
    if (tituloPersonagen.length > 22) {
      return "Tamanho máximo de 22 caracteres!";
    }
    return null;
  }
}
