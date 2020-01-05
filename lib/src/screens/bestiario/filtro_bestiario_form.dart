import 'package:flutter/material.dart';
import 'package:millenium/src/models/enum_flag_filtro_nivel.dart';
import 'package:millenium/src/models/filtro_bestiario.dart';
import 'package:millenium/src/util/theme.dart';

class FiltroBestiarioForm extends StatefulWidget {
  final FiltroBestiario filtro;
  final Function(FiltroBestiario) onChanged;

  FiltroBestiarioForm({@required this.filtro, @required this.onChanged});

  @override
  _FiltroBestiarioFormState createState() =>
      _FiltroBestiarioFormState(filtro: filtro, onChanged: onChanged);
}

class _FiltroBestiarioFormState extends State<FiltroBestiarioForm> {
  FiltroBestiario filtro;
  Function(FiltroBestiario) onChanged;

  _FiltroBestiarioFormState({@required this.filtro, @required this.onChanged});

  final List<String> classificacoes = ["Animal", "Fera", "Monstro"];
  final Map<String, bool> localizacoes = {
    "Floresta": false,
    "Ruína": false,
    "Pântano": false,
    "Montanha": false,
    "Deserto": false,
    "Mar": false,
  };

  @override
  void initState() {
    super.initState();

    if (filtro == null) {
      filtro = FiltroBestiario(
        flag: FlagFiltroNivel.EqualTo,
        nivel: 1,
        classificacao: classificacoes.first,
        localizacoes: [],
      );
    }

    filtro.localizacoes.forEach((nomeLocal) {
      localizacoes[nomeLocal] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Filtro"),
      contentPadding: EdgeInsets.all(0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownButton<FlagFiltroNivel>(
              isExpanded: true,
              value: filtro.flag,
              items: [
                DropdownMenuItem<FlagFiltroNivel>(
                  value: FlagFiltroNivel.EqualTo,
                  child: Text("Igual à"),
                ),
                DropdownMenuItem<FlagFiltroNivel>(
                  value: FlagFiltroNivel.GreaterThan,
                  child: Text("Maior que"),
                ),
                DropdownMenuItem<FlagFiltroNivel>(
                  value: FlagFiltroNivel.LessThan,
                  child: Text("Menor que"),
                )
              ],
              onChanged: (newValue) {
                setState(() {
                  filtro.flag = newValue;
                });
              },
            ),
          ),
          _Nivel(
            nivel: filtro.nivel,
            onChanged: (newValue) {
              setState(() {
                filtro.nivel = newValue;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownButton<String>(
              isExpanded: true,
              value: filtro.classificacao,
              items: classificacoes.map<DropdownMenuItem<String>>((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  filtro.classificacao = newValue;
                });
              },
            ),
          ),
          GridView(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 160,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              childAspectRatio: 3,
            ),
            children: localizacoes.keys.map((nomeLocal) {
              return CheckboxListTile(
                activeColor: primaryColor,
                secondary: Text(nomeLocal),
                value: localizacoes[nomeLocal],
                onChanged: (newValue) {
                  if (filtro.localizacoes.contains(nomeLocal)) {
                    filtro.localizacoes.remove(nomeLocal);
                  } else {
                    filtro.localizacoes.add(nomeLocal);
                  }
                  setState(() {
                    localizacoes[nomeLocal] = newValue;
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
      actions: <Widget>[
        SizedBox(
          width: 80,
          child: RaisedButton(
            child: Text(
              "Voltar",
              style: TextStyle(fontSize: 16),
            ),
            color: primaryColor,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        SizedBox(
          width: 80,
          child: RaisedButton(
            child: Text(
              "Limpar",
              style: TextStyle(fontSize: 16),
            ),
            color: primaryColor,
            onPressed: () {
              Navigator.of(context).pop();
              onChanged(null);
            },
          ),
        ),
        SizedBox(
          width: 80,
          child: RaisedButton(
            child: Text(
              "Filtrar",
              style: TextStyle(fontSize: 16),
            ),
            color: primaryColor,
            onPressed: () {
              Navigator.of(context).pop();
              onChanged(filtro);
            },
          ),
        )
      ],
    );
  }
}

class _Nivel extends StatelessWidget {
  final int nivel;
  final Function(int) onChanged;

  _Nivel({@required this.nivel, @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(6, (index) {
        return SizedBox(
          width: 40,
          child: IconButton(
            icon: index >= nivel
                ? Icon(
                    Icons.star_border,
                    color: primaryColor,
                    size: 40,
                  )
                : Icon(
                    Icons.star,
                    color: primaryColor,
                    size: 40,
                  ),
            onPressed: () {
              onChanged(index + 1);
            },
          ),
        );
      }),
    );
  }
}
