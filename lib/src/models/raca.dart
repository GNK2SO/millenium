import 'package:millenium/src/models/atributos.dart';

class Raca {
  String nome;

  Atributos atributos;

  Raca({
    this.nome,
    this.atributos,
  });

  Raca.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    atributos = json['atributos'] != null
        ? new Atributos.fromJson(json['atributos'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    if (this.atributos != null) {
      data['atributos'] = this.atributos.toJson();
    }
    return data;
  }
}
