class EquipamentoValidator {
  static String isNotEmpty(String value) {
    if (value.isEmpty || value == null) {
      return ("Campo obrigatório!");
    }
    return null;
  }
}
