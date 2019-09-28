class Habilidade {
  String nome;
  String tipo;
  String descricao;
  int custo;

  Habilidade({this.nome, this.tipo, this.descricao, this.custo});

  Habilidade.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    tipo = json['tipo'];
    descricao = json['descricao'];
    descricao = json['custo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['tipo'] = this.tipo;
    data['descricao'] = this.descricao;
    data['custo'] = this.custo;
    return data;
  }
}
