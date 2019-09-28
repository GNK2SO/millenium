class Comunicado {
  String titulo;
  String descricao;
  String data;

  Comunicado({this.titulo, this.descricao, this.data});

  Comunicado.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    descricao = json['descricao'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titulo'] = this.titulo;
    data['descricao'] = this.descricao;
    data['data'] = this.data;
    return data;
  }
}
