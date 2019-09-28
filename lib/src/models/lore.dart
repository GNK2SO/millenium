class Lore {
  String nome;
  String descricao;
  String data;

  Lore({this.nome, this.descricao, this.data});

  Lore.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    descricao = json['descricao'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['descricao'] = this.descricao;
    data['data'] = this.data;
    return data;
  }
}
