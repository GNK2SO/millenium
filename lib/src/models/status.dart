class Status {
  String titulo;
  String descricao;

  Status({this.titulo, this.descricao});

  Status.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    descricao = json['descricao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titulo'] = this.titulo;
    data['descricao'] = this.descricao;
    return data;
  }
}
