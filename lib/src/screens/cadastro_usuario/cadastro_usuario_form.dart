import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:millenium/src/bloc/authentication_bloc/authentication_event.dart';
import 'package:millenium/src/bloc/cadastro_usuario_bloc/cadastro_usuario_bloc.dart';
import 'package:millenium/src/bloc/cadastro_usuario_bloc/cadastro_usuario_event.dart';
import 'package:millenium/src/bloc/cadastro_usuario_bloc/cadastro_usuario_state.dart';
import 'package:millenium/src/bloc/login_bloc/login_bloc.dart';
import 'package:millenium/src/bloc/login_bloc/login_event.dart';
import 'package:millenium/src/bloc/login_bloc/login_state.dart';
import 'package:millenium/src/components/animated_button.dart';
import 'package:millenium/src/util/util.dart';
import 'package:millenium/src/validators/usuario_validator.dart';

class CadastroUsuarioForm extends StatefulWidget {
  @override
  _CadastroUsuarioFormState createState() => _CadastroUsuarioFormState();
}

class _CadastroUsuarioFormState extends State<CadastroUsuarioForm>
    with SingleTickerProviderStateMixin, UsuarioValidator {
  CadastroUsuarioBloc _bloc;
  AnimationController _animationController;
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<CadastroUsuarioBloc>(context);
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
    _animationController.dispose();
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CadastroUsuarioBloc, CadastroUsuarioState>(
          listener: (context, state) {
            if (state.isFailure) {
              showMessage(
                key: _scaffoldKey,
                mensagem: "Falha no cadastro.\nVerifique sua conexão.",
              );
              _animationController.reset();
            } else if (state.isSuccess) {
              BlocProvider.of<LoginBloc>(context).dispatch(
                LoginWithCredentialsPressed(
                  email: _emailController.text,
                  senha: _senhaController.text,
                ),
              );
            }
          },
        ),
        BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.isFailure) {
              showMessage(
                key: _scaffoldKey,
                mensagem:
                    "Falha na autenticação.\nVerifique seu usuário/senha ou sua conexão.",
              );
              _animationController.reset();
            } else if (state.isSuccess) {
              BlocProvider.of<AuthenticationBloc>(context).dispatch(LoggedIn());
              Navigator.of(context).pop();
            }
          },
        ),
      ],
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Scaffold(
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
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Nome",
                    contentPadding: const EdgeInsets.all(0),
                  ),
                  controller: _nomeController,
                  validator: isValidNome,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    contentPadding: const EdgeInsets.all(0),
                  ),
                  controller: _emailController,
                  validator: isValidEmail,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Senha",
                    contentPadding: const EdgeInsets.all(0),
                  ),
                  controller: _senhaController,
                  obscureText: true,
                  validator: isValidSenha,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Confirmar Senha",
                    contentPadding: const EdgeInsets.all(0),
                  ),
                  obscureText: true,
                  validator: _confirmarSenhaValidator,
                ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _confirmarSenhaValidator(String confirmarSenha) {
    if (confirmarSenha != _senhaController.text) {
      return "Senhas não são iguais!";
    }
    return isValidSenha(confirmarSenha);
  }

  void _onFormSubmitted() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    CadastroUsuarioState state =
        BlocProvider.of<CadastroUsuarioBloc>(context).currentState;
    bool isValidForm = _formKey.currentState.validate();
    if (!state.isSubmitting && isValidForm) {
      _animationController.forward();
      _bloc.dispatch(
        FormSubmitted(
          nome: _nomeController.text,
          email: _emailController.text,
          senha: _senhaController.text,
        ),
      );
    }
  }
}
