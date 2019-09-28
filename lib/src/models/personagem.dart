import 'package:millenium/src/models/atributos.dart';
import 'package:millenium/src/models/equipamento.dart';
import 'package:millenium/src/models/habilidade.dart';
import 'package:millenium/src/models/status.dart';
import 'package:millenium/src/models/titulo.dart';

class Personagem {
  String nome;
  int vida;
  int energia;
  int fome;
  int level;
  int xp;
  List<Status> status;
  List<Titulo> titulos;
  Atributos atributos;
  List<Habilidade> habilidades;
  List<Equipamento> equipamentos;

  Personagem(
      {this.nome,
      this.vida,
      this.energia,
      this.fome,
      this.level,
      this.xp,
      this.status,
      this.titulos,
      this.atributos,
      this.habilidades,
      this.equipamentos});

  Personagem.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    vida = json['vida'];
    energia = json['energia'];
    fome = json['fome'];
    level = json['level'];
    xp = json['xp'];
    if (json['status'] != null) {
      status = new List<Status>();
      json['status'].forEach((status) {
        status.add(new Status.fromJson(status));
      });
    }
    if (json['titulos'] != null) {
      titulos = new List<Titulo>();
      json['titulos'].forEach((titulo) {
        titulos.add(new Titulo.fromJson(titulo));
      });
    }
    atributos = json['atributos'] != null
        ? new Atributos.fromJson(json['atributos'])
        : null;
    if (json['habilidades'] != null) {
      habilidades = new List<Habilidade>();
      json['habilidades'].forEach((habilidade) {
        habilidades.add(new Habilidade.fromJson(habilidade));
      });
    }
    // if (json['equipamentos'] != null) {
    //   equipamentos = new List<Equipamento>();
    //   json['equipamentos'].forEach((equipamentos) {
    //     equipamentos.add(new Equipamento.fromJson(equipamentos));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['vida'] = this.vida;
    data['energia'] = this.energia;
    data['fome'] = this.fome;
    data['level'] = this.level;
    data['xp'] = this.xp;
    if (this.status != null) {
      data['status'] = this.status.map((status) => status.toJson()).toList();
    }
    if (this.titulos != null) {
      data['titulos'] = this.titulos.map((titulo) => titulo.toJson()).toList();
    }
    if (this.atributos != null) {
      data['atributos'] = this.atributos.toJson();
    }
    if (this.habilidades != null) {
      data['habilidades'] =
          this.habilidades.map((habilidade) => habilidade.toJson()).toList();
    }
    // if (this.equipamentos != null) {
    //   data['equipamentos'] =
    //       this.equipamentos.map((equipamento) => equipamento.toJson()).toList();
    // }
    return data;
  }
}
