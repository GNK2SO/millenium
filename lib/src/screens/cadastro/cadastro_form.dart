import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/blocs/usuario_bloc/usuario_bloc.dart';
import 'package:millenium/src/blocs/usuario_bloc/usuario_event.dart';
import 'package:millenium/src/blocs/usuario_bloc/usuario_state.dart';
import 'package:millenium/src/components/form/animated_button.dart';
import 'package:millenium/src/components/form/text_field.dart';
import 'package:millenium/src/screens/home_screen.dart';
import 'package:millenium/src/util/util.dart';
import 'package:millenium/src/validators/usuario_validator.dart';

class CadastroForm extends StatefulWidget {
  @override
  _CadastroFormState createState() => _CadastroFormState();
}

class _CadastroFormState extends State<CadastroForm>
    with SingleTickerProviderStateMixin, UsuarioValidator {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmarSenhaController = TextEditingController();
  AnimationController _animationController;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

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
    _nomeController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    _confirmarSenhaController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UsuarioBloc, UsuarioState>(
      listener: (context, state) {
        if (state is UsuarioSuccess) {
          replaceTo(
            context,
            HomeScreen(usuario: state.usuario),
          );
        } else if (state is UsuarioFailure) {
          _animationController.reset();
          showMessage(
            key: _scaffoldKey,
            mensagem: state.erro,
          );
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Cadastro"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                CustomTextField(
                  labelText: "Nome",
                  controller: _nomeController,
                  validator: isValidNome,
                ),
                CustomTextField(
                  labelText: "Email",
                  controller: _emailController,
                  validator: isValidEmail,
                ),
                CustomTextField(
                  labelText: "Senha",
                  controller: _senhaController,
                  validator: isValidSenha,
                  obscureText: true,
                ),
                CustomTextField(
                  labelText: "Confirmar Senha",
                  controller: _confirmarSenhaController,
                  validator: _isValidConfimarSenha,
                  obscureText: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: AnimatedButton(
                    text: "CADASTRAR",
                    controller: _animationController.view,
                    onPressed: () {
                      _onFormSubmitted();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onFormSubmitted() {
    if (_formKey.currentState.validate()) {
      _animationController.forward();
      BlocProvider.of<UsuarioBloc>(context).add(SalvarUsuario(
        nome: _nomeController.text,
        email: _emailController.text,
        senha: _senhaController.text,
      ));
    }
  }

  String _isValidConfimarSenha(String confirmarSenha) {
    if (confirmarSenha != _senhaController.text) {
      return "Senha não são iguais!";
    }
    return isValidSenha(confirmarSenha);
  }
}
