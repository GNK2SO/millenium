class AtributosExploracao {
  int pontosDistribuicao;
  int carisma;
  int governacao;
  int navegacao;
  int sobrevivencia;
  int comercio;
  int construcao;
  int exploracao;
  int militarismo;
  int sabedoria;
  int magia;

  AtributosExploracao({
    this.pontosDistribuicao: 0,
    this.carisma: 0,
    this.governacao: 0,
    this.navegacao: 0,
    this.sobrevivencia: 0,
    this.comercio: 0,
    this.construcao: 0,
    this.exploracao: 0,
    this.militarismo: 0,
    this.sabedoria: 0,
    this.magia: 0,
  });

  AtributosExploracao.fromJson(Map<String, dynamic> json) {
    pontosDistribuicao = json['pontosDistribuicao'];
    carisma = json['carisma'];
    governacao = json['governacao'];
    navegacao = json['navegacao'];
    sobrevivencia = json['sobrevivencia'];
    comercio = json['comercio'];
    construcao = json['construcao'];
    exploracao = json['exploracao'];
    militarismo = json['militarismo'];
    sabedoria = json['sabedoria'];
    magia = json['magia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pontosDistribuicao'] = this.pontosDistribuicao;
    data['carisma'] = this.carisma;
    data['governacao'] = this.governacao;
    data['navegacao'] = this.navegacao;
    data['sobrevivencia'] = this.sobrevivencia;
    data['comercio'] = this.comercio;
    data['construcao'] = this.construcao;
    data['exploracao'] = this.exploracao;
    data['militarismo'] = this.militarismo;
    data['sabedoria'] = this.sabedoria;
    data['magia'] = this.magia;
    return data;
  }
}
