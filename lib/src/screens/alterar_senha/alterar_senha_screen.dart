import 'package:flutter/material.dart';
import 'package:millenium/src/components/form/animated_button.dart';
import 'package:millenium/src/components/form/text_input.dart';
import 'package:millenium/src/validators/usuario_validator.dart';

class AlterarSenhaScreen extends StatefulWidget {
  @override
  _AlterarSenhaScreenState createState() => _AlterarSenhaScreenState();
}

class _AlterarSenhaScreenState extends State<AlterarSenhaScreen>
    with SingleTickerProviderStateMixin, UsuarioValidator {
  AnimationController _animationController;
  final _senhaController = TextEditingController();
  final _novaSenhaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _senhaController.dispose();
    _novaSenhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alterar senha"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: <Widget>[
              TextInput(
                labelText: "Senha atual",
                validator: isValidSenha,
                controller: _senhaController,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
              ),
              TextInput(
                labelText: "Nova senha",
                validator: isValidSenha,
                controller: _novaSenhaController,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
              ),
              TextInput(
                labelText: "Confirmar nova senha",
                validator: _isValidConfimarSenha,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
              ),
              AnimatedButton(
                text: "ALTERAR SENHA",
                controller: _animationController.view,
                primaryColor: Theme.of(context).primaryColor,
                textColor: Colors.white,
                circularIndicatorProgressColor: Colors.white,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _isValidConfimarSenha(String confirmarSenha) {
    if (confirmarSenha != _novaSenhaController.text) {
      return "Senha não são iguais!";
    }
    return isValidSenha(confirmarSenha);
  }
}
