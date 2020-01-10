import 'package:flutter/material.dart';
import 'package:millenium/src/components/form/input/descricao_text_input.dart';
import 'package:millenium/src/components/form/input/text_input.dart';
import 'package:millenium/src/models/consumivel/consumivel.dart';
import 'package:millenium/src/models/equipamento/arma/arma.dart';
import 'package:millenium/src/models/equipamento/armadura/armadura.dart';
import 'package:millenium/src/models/equipamento/capa/capa.dart';
import 'package:millenium/src/models/item/item.dart';
import 'package:millenium/src/models/personagem/personagem.dart';
import 'package:millenium/src/validators/equipamento_validator.dart';

class FormCadastroItem extends StatefulWidget {
  final Personagem personagem;
  final Function(Personagem) onSaved;

  FormCadastroItem({@required this.personagem, @required this.onSaved});

  @override
  _FormCadastroItemState createState() =>
      _FormCadastroItemState(personagem: personagem, onSaved: onSaved);
}

class _FormCadastroItemState extends State<FormCadastroItem> {
  final Personagem personagem;
  final Function(Personagem) onSaved;

  _FormCadastroItemState({@required this.personagem, @required this.onSaved});

  String dropdownItemValue;
  String dropdownEquipamentoValue;
  String dropdownParteArmaduraValue;

  final tiposItem = ['Item', 'Arma', 'Armadura', 'Consumível', 'Capa'];
  final tiposEquipamento = ['Pesado', 'Médio', 'Leve'];
  final partesArmadura = [
    'Set',
    'Elmo',
    'Peitoral',
    'Luvas',
    'Grevas',
    'Botas',
  ];

  final _formKey = GlobalKey<FormState>();

  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _quantidadeController = TextEditingController();
  final _danoDefesaController = TextEditingController();
  final _resistenciaFrioController = TextEditingController();
  final _vidaController = TextEditingController();
  final _energiaController = TextEditingController();
  final _manaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _quantidadeController.text = "0";
    _danoDefesaController.text = "0";
    _resistenciaFrioController.text = "0";
    _vidaController.text = "0";
    _energiaController.text = "0";
    _manaController.text = "0";
    dropdownItemValue = tiposItem.first;
    dropdownEquipamentoValue = tiposEquipamento.first;
    dropdownParteArmaduraValue = partesArmadura.first;
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _descricaoController.dispose();
    _quantidadeController.dispose();
    _danoDefesaController.dispose();
    _resistenciaFrioController.dispose();
    _vidaController.dispose();
    _energiaController.dispose();
    _manaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Novo Item"),
      contentPadding: const EdgeInsets.all(8),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              DropdownButton<String>(
                value: dropdownItemValue,
                onChanged: (String newValue) {
                  setState(() {
                    dropdownItemValue = newValue;
                  });
                },
                items: tiposItem.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: SizedBox(
                      width: 208,
                      child: Text(value),
                    ),
                  );
                }).toList(),
              ),
              TextInput(
                labelText: "Nome",
                controller: _nomeController,
                validator: EquipamentoValidator.isNotEmpty,
              ),
              _buildVariantsInputs(dropdownItemValue),
              DescricaoTextInput(
                hintText: "Descrição",
                maxLines: 5,
                controller: _descricaoController,
              ),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: Text(
                      "Voltar",
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  RaisedButton(
                    child: Text(
                      "Salvar",
                      style: TextStyle(fontSize: 16),
                    ),
                    color: Theme.of(context).primaryColor,
                    onPressed: _onSalvarEquipamento,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVariantsInputs(String value) {
    switch (value) {
      case 'Item':
        return TextInput(
          labelText: "Quantidade",
          controller: _quantidadeController,
          keyboardType: TextInputType.number,
          validator: EquipamentoValidator.isNotEmpty,
        );
      case 'Arma':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DropdownButton<String>(
              value: dropdownEquipamentoValue,
              onChanged: (String newValue) {
                setState(() {
                  dropdownEquipamentoValue = newValue;
                });
              },
              items: tiposEquipamento
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: SizedBox(
                    width: 208,
                    child: Text(value),
                  ),
                );
              }).toList(),
            ),
            TextInput(
              labelText: "Dano",
              controller: _danoDefesaController,
              keyboardType: TextInputType.number,
              validator: EquipamentoValidator.isNotEmpty,
            ),
          ],
        );
      case 'Armadura':
        return Column(
          children: <Widget>[
            DropdownButton<String>(
              value: dropdownEquipamentoValue,
              onChanged: (String newValue) {
                setState(() {
                  dropdownEquipamentoValue = newValue;
                });
              },
              items: tiposEquipamento
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: SizedBox(
                    width: 208,
                    child: Text(value),
                  ),
                );
              }).toList(),
            ),
            DropdownButton<String>(
              value: dropdownParteArmaduraValue,
              onChanged: (String newValue) {
                setState(() {
                  dropdownParteArmaduraValue = newValue;
                });
              },
              items:
                  partesArmadura.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: SizedBox(
                    width: 208,
                    child: Text(value),
                  ),
                );
              }).toList(),
            ),
            TextInput(
              labelText: "Defesa",
              controller: _danoDefesaController,
              keyboardType: TextInputType.number,
              validator: EquipamentoValidator.isNotEmpty,
            ),
          ],
        );
      case 'Capa':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextInput(
              labelText: "Resistência Frio",
              controller: _resistenciaFrioController,
              keyboardType: TextInputType.number,
              validator: EquipamentoValidator.isNotEmpty,
            ),
          ],
        );

      case 'Consumível':
        return Row(
          children: [
            Expanded(
              child: TextInput(
                labelText: "Vida",
                controller: _vidaController,
                keyboardType: TextInputType.number,
                validator: EquipamentoValidator.isNotEmpty,
              ),
            ),
            SizedBox(width: 24),
            Expanded(
              child: TextInput(
                labelText: "Energia",
                controller: _energiaController,
                keyboardType: TextInputType.number,
                validator: EquipamentoValidator.isNotEmpty,
              ),
            ),
            SizedBox(width: 24),
            Expanded(
              child: TextInput(
                labelText: "Mana",
                controller: _manaController,
                keyboardType: TextInputType.number,
                validator: EquipamentoValidator.isNotEmpty,
              ),
            ),
          ],
        );
      default:
        return Container();
    }
  }

  void _onSalvarEquipamento() {
    bool isFormValid = _formKey.currentState.validate();
    if (isFormValid) {
      Navigator.of(context).pop();
      switch (dropdownItemValue) {
        case 'Arma':
          final Arma arma = Arma(
            nome: _nomeController.text,
            descricao: _descricaoController.text,
            tipo: dropdownItemValue,
            tipoEquipamento: dropdownEquipamentoValue,
            dano: int.parse(_danoDefesaController.text),
          );
          personagem.bolsa.add(arma);
          break;
        case 'Armadura':
          if (dropdownParteArmaduraValue == 'Set') {
            getFullSetArmadura().forEach((parteArmadura) {
              personagem.bolsa.add(parteArmadura);
            });
          } else {
            final Armadura armadura = Armadura(
              nome: _nomeController.text,
              descricao: _descricaoController.text,
              tipo: dropdownItemValue,
              tipoEquipamento: dropdownEquipamentoValue,
              parte: dropdownParteArmaduraValue,
              defesa: int.parse(_danoDefesaController.text),
            );
            personagem.bolsa.add(armadura);
          }
          break;
        case 'Capa':
          final Capa capa = Capa(
            nome: _nomeController.text,
            descricao: _descricaoController.text,
            tipo: dropdownItemValue,
            resistenciaFrio: int.parse(_resistenciaFrioController.text),
          );
          personagem.bolsa.add(capa);
          break;
        case 'Consumível':
          final Consumivel consumivel = Consumivel(
            nome: _nomeController.text,
            descricao: _descricaoController.text,
            tipo: dropdownItemValue,
            vida: int.parse(_vidaController.text),
            energia: int.parse(_energiaController.text),
            mana: int.parse(_manaController.text),
          );
          personagem.bolsa.add(consumivel);
          break;
        case 'Item':
          final Item item = Item(
            nome: _nomeController.text,
            quantidade: int.parse(_quantidadeController.text),
            descricao: _descricaoController.text,
            tipo: dropdownItemValue,
          );
          personagem.bolsa.add(item);
          break;
      }

      onSaved(personagem);
    }
  }

  List<Armadura> getFullSetArmadura() {
    int defesa = int.parse(_danoDefesaController.text);
    int resto = defesa % 5;
    defesa -= resto;
    return [
      Armadura(
        nome: "Elmo ${_nomeController.text}",
        descricao: _descricaoController.text,
        tipo: dropdownItemValue,
        tipoEquipamento: dropdownEquipamentoValue,
        parte: "Elmo",
        defesa: defesa ~/ 5,
      ),
      Armadura(
        nome: "Peitoral ${_nomeController.text}",
        descricao: _descricaoController.text,
        tipo: dropdownItemValue,
        tipoEquipamento: dropdownEquipamentoValue,
        parte: "Peitoral",
        defesa: (defesa ~/ 5) + resto,
      ),
      Armadura(
        nome: "Luvas ${_nomeController.text}",
        descricao: _descricaoController.text,
        tipo: dropdownItemValue,
        tipoEquipamento: dropdownEquipamentoValue,
        parte: "Luvas",
        defesa: defesa ~/ 5,
      ),
      Armadura(
        nome: "Grevas ${_nomeController.text}",
        descricao: _descricaoController.text,
        tipo: dropdownItemValue,
        tipoEquipamento: dropdownEquipamentoValue,
        parte: "Grevas",
        defesa: defesa ~/ 5,
      ),
      Armadura(
        nome: "Botas ${_nomeController.text}",
        descricao: _descricaoController.text,
        tipo: dropdownItemValue,
        tipoEquipamento: dropdownEquipamentoValue,
        parte: "Botas",
        defesa: defesa ~/ 5,
      )
    ];
  }
}
