class Titulo {
  String nome;
  String descricao;

  Titulo({this.nome, this.descricao});

  Titulo.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    descricao = json['descricao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['descricao'] = this.descricao;
    return data;
  }
}
