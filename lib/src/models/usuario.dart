class Usuario {
  String uid;
  String nome;
  String email;
  String senha;
  bool isAdmin;

  Usuario({
    this.uid,
    this.nome,
    this.email,
    this.senha,
    this.isAdmin,
  });

  Usuario.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    email = json['email'];
    senha = json['senha'];
    isAdmin = json['isAdmin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['senha'] = this.senha;
    data['isAdmin'] = this.isAdmin;
    return data;
  }
}
