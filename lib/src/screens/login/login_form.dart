import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:millenium/src/bloc/authentication_bloc/authentication_event.dart';
import 'package:millenium/src/bloc/login_bloc/login_bloc.dart';
import 'package:millenium/src/bloc/login_bloc/login_event.dart';
import 'package:millenium/src/bloc/login_bloc/login_state.dart';
import 'package:millenium/src/components/animated_button.dart';
import 'package:millenium/src/components/circular_button.dart';
import 'package:millenium/src/components/custom_divider.dart';
import 'package:millenium/src/util/util.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>
    with SingleTickerProviderStateMixin {
  LoginBloc _bloc;
  AnimationController _animationController;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<LoginBloc>(context);
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
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
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return _buildBody(state);
        },
      ),
    );
  }

  Widget _buildBody(LoginState state) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Millenium",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'pentagrams_malefissent',
                        fontSize: 72,
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
                        onChanged: _onEmailChanged,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Senha",
                          contentPadding: const EdgeInsets.all(0),
                        ),
                        controller: _senhaController,
                        onChanged: _onSenhaChanged,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: AnimatedButton(
                        text: "ENTRAR",
                        controller: _animationController.view,
                        onPressed: isLoginButtonEnabled(state)
                            ? () => this._onFormSubmitted(state)
                            : null,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(child: CustomDivider()),
                        Expanded(
                          child: Text(
                            "ou",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(child: CustomDivider())
                      ],
                    ),
                    CircularButton(
                      text: "CRIAR CONTA",
                      onPressed: () {
                        Navigator.of(context).pushNamed("/cadastroContaScreen");
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onEmailChanged(String email) {
    _bloc.dispatch(
      EmailChanged(email: email),
    );
  }

  void _onSenhaChanged(String senha) {
    _bloc.dispatch(
      SenhaChanged(senha: senha),
    );
  }

  bool isLoginButtonEnabled(LoginState state) {
    return state.isEmailValid && state.isSenhaValid;
  }

  void _onFormSubmitted(LoginState state) {
    if (!state.isSubmitting) {
      _animationController.forward();
      _bloc.dispatch(
        LoginWithCredentialsPressed(
          email: _emailController.text,
          senha: _senhaController.text,
        ),
      );
    }
  }
}
