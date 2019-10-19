import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:millenium/src/blocs/cadastro_usuario_bloc.dart';
import 'package:millenium/src/blocs/usuario_bloc.dart';
import 'package:millenium/src/components/form/animated_button.dart';
import 'package:millenium/src/components/form/text_field.dart';
import 'package:millenium/src/models/page_state.dart';
import 'package:millenium/src/screens/jogador/jogador_home_screen.dart';
import 'package:millenium/src/util/util.dart';
import 'package:millenium/src/validators/usuario_validator.dart';

class CadastroUsuarioScreen extends StatefulWidget {
  @override
  _CadastroUsuarioScreenState createState() => _CadastroUsuarioScreenState();
}

class _CadastroUsuarioScreenState extends State<CadastroUsuarioScreen>
    with SingleTickerProviderStateMixin, UsuarioValidator {
  final _bloc = CadastroUsuarioBloc();
  final UsuarioBloc _userbloc = BlocProvider.getBloc<UsuarioBloc>();
  final _senhaController = TextEditingController();
  AnimationController _animationController;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _bloc.stateStream.listen(
      (state) async {
        switch (state) {
          case PageState.SUCCESS:
            replaceTo(
                context,
                JogadorHomeScreen(
                  usuario: await _userbloc.obterUsuario(),
                ));
            _bloc.stateSink.add(PageState.SCREEN);
            break;
          case PageState.FAILED:
            _animationController.reset();
            showMessage(
              key: _scaffoldKey,
              mensagem:
                  "Falha no cadastro.\nVerifique seu usuário/senha ou sua conexao.",
            );
            break;
          default:
        }
      },
    );

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _senhaController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PageState>(
      stream: _bloc.stateStream,
      builder: (context, snapshot) {
        return _buildBody(snapshot.data);
      },
    );
  }

  Widget _buildBody(PageState state) {
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
              CustomTextField(
                stream: _bloc.nomeStream,
                sink: _bloc.nomeSink,
                labelText: "Nome",
                validator: isValidNome,
              ),
              CustomTextField(
                stream: _bloc.emailStream,
                sink: _bloc.emailSink,
                labelText: "Email",
                validator: isValidEmail,
              ),
              CustomTextField(
                stream: _bloc.senhaStream,
                sink: _bloc.senhaSink,
                controller: _senhaController,
                labelText: "Senha",
                obscureText: true,
                validator: isValidSenha,
              ),
              CustomTextField(
                labelText: "Confirmar Senha",
                obscureText: true,
                validator: (senha) {
                  _confirmarSenhaValidator(senha);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: AnimatedButton(
                  text: "CADASTRAR",
                  controller: _animationController.view,
                  onPressed: () {
                    _onFormSubmitted(state);
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
    print(confirmarSenha);
    print(_senhaController.text);
    if (confirmarSenha != _senhaController.text) {
      return "Senhas não são iguais!";
    }
    return isValidSenha(confirmarSenha);
  }

  void _onFormSubmitted(PageState state) {
    bool isFormValidate = _formKey.currentState.validate();
    if (state != PageState.LOADING && isFormValidate) {
      _animationController.forward();
      _bloc.salvarUsuario();
    }
  }
}
