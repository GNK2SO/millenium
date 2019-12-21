import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/blocs/authentication_bloc/authentication_event.dart';
import 'package:millenium/src/blocs/login_bloc/login_bloc.dart';
import 'package:millenium/src/blocs/login_bloc/login_event.dart';
import 'package:millenium/src/blocs/login_bloc/login_state.dart';
import 'package:millenium/src/blocs/usuario_bloc/usuario_bloc.dart';
import 'package:millenium/src/blocs/usuario_bloc/usuario_event.dart';
import 'package:millenium/src/blocs/usuario_bloc/usuario_state.dart';
import 'package:millenium/src/components/form/animated_button.dart';
import 'package:millenium/src/components/form/text_input.dart';
import 'package:millenium/src/blocs/authentication_bloc/authentication_bloc.dart';
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
    return MultiBlocListener(
      listeners: [
        BlocListener<UsuarioBloc, UsuarioState>(
          listener: (context, state) {
            if (state is UsuarioSuccess) {
              BlocProvider.of<LoginBloc>(context).add(
                Autenticar(
                  email: _emailController.text,
                  senha: _senhaController.text,
                ),
              );
            } else if (state is UsuarioFailure) {
              _animationController.reset();
              showMessage(
                key: _scaffoldKey,
                mensagem: state.erro,
              );
            }
          },
        ),
        BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
              Navigator.of(context).pop();
            }
          },
        ),
      ],
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Cadastro"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextInput(
                  labelText: "Nome",
                  controller: _nomeController,
                  validator: isValidNome,
                  keyboardType: TextInputType.emailAddress,
                  primaryColor: Theme.of(context).primaryColor,
                ),
                TextInput(
                  labelText: "Email",
                  controller: _emailController,
                  validator: isValidEmail,
                  keyboardType: TextInputType.emailAddress,
                  primaryColor: Theme.of(context).primaryColor,
                ),
                TextInput(
                  labelText: "Senha",
                  controller: _senhaController,
                  validator: isValidSenha,
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  primaryColor: Theme.of(context).primaryColor,
                ),
                TextInput(
                  labelText: "Confirmar Senha",
                  controller: _confirmarSenhaController,
                  validator: _isValidConfimarSenha,
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  primaryColor: Theme.of(context).primaryColor,
                ),
                AnimatedButton(
                  text: "CADASTRAR",
                  controller: _animationController.view,
                  primaryColor: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  circularIndicatorProgressColor: Colors.white,
                  onPressed: () {
                    _onFormSubmitted();
                  },
                ),
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
