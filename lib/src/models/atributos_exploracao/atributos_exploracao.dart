import 'package:json_annotation/json_annotation.dart';

part 'atributos_exploracao.g.dart';

@JsonSerializable()
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

  factory AtributosExploracao.fromJson(Map<String, dynamic> json) =>
      _$AtributosExploracaoFromJson(json);

  Map<String, dynamic> toJson() => _$AtributosExploracaoToJson(this);

  @override
  String toString() {
    return '''{
        carisma: ${this.carisma}
        governacao: ${this.governacao}
        navegacao: ${this.navegacao}
        sobrevivencia: ${this.sobrevivencia}
        comercio: ${this.comercio}
        construcao: ${this.construcao}
        exploracao: ${this.exploracao}
        militarismo: ${this.militarismo}
        sabedoria: ${this.sabedoria}
        magia: ${this.magia}
      }
    ''';
  }
}
