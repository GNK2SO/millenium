import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/blocs/authentication_bloc/authentication_event.dart';
import 'package:millenium/src/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:millenium/src/blocs/login_bloc/login_bloc.dart';
import 'package:millenium/src/blocs/login_bloc/login_event.dart';
import 'package:millenium/src/blocs/login_bloc/login_state.dart';
import 'package:millenium/src/components/form/animated_button.dart';
import 'package:millenium/src/components/form/circular_button.dart';
import 'package:millenium/src/components/form/text_input.dart';
import 'package:millenium/src/components/utils/custom_divider.dart';
import 'package:millenium/src/components/logo.dart';
import 'package:millenium/src/util/util.dart';
import 'package:millenium/src/validators/usuario_validator.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>
    with SingleTickerProviderStateMixin, UsuarioValidator {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  AnimationController _animationController;

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
    _emailController.dispose();
    _senhaController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
        } else if (state is LoginFailure) {
          showMessage(
            key: _scaffoldKey,
            mensagem: state.erro,
          );
          _animationController.reset();
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/wallpaper.jpeg"))),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xDD012F4F),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Logo(),
                        TextInput(
                          labelText: "Email",
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: isValidEmail,
                        ),
                        TextInput(
                          labelText: "Senha",
                          controller: _senhaController,
                          keyboardType: TextInputType.emailAddress,
                          validator: isValidSenha,
                          obscureText: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: AnimatedButton(
                            text: "ENTRAR",
                            circularIndicatorProgressColor:
                                Theme.of(context).primaryColor,
                            controller: _animationController.view,
                            onPressed: () {
                              _onFormSubmitted();
                            },
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: CustomDivider(
                              color: Colors.white,
                            )),
                            Expanded(
                              child: Text(
                                "ou",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Expanded(
                                child: CustomDivider(
                              color: Colors.white,
                            ))
                          ],
                        ),
                        CircularButton(
                          text: "CRIAR CONTA",
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed("/cadastroContaScreen");
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onFormSubmitted() {
    if (_formKey.currentState.validate()) {
      _animationController.forward();
      BlocProvider.of<LoginBloc>(context).add(Autenticar(
        email: _emailController.text,
        senha: _senhaController.text,
      ));
    }
  }
}
