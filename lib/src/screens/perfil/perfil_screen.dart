import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millenium/src/blocs/usuario_bloc/usuario_bloc.dart';
import 'package:millenium/src/blocs/usuario_bloc/usuario_event.dart';
import 'package:millenium/src/blocs/usuario_bloc/usuario_state.dart';
import 'package:millenium/src/components/form/animated_button.dart';
import 'package:millenium/src/components/form/image_form_field.dart';
import 'package:millenium/src/components/form/text_input.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/util/util.dart';
import 'package:millenium/src/validators/usuario_validator.dart';

class PerfilScreen extends StatefulWidget {
  final Usuario usuario;

  PerfilScreen({@required this.usuario});

  @override
  _PerfilScreenState createState() => _PerfilScreenState(usuario: usuario);
}

class _PerfilScreenState extends State<PerfilScreen>
    with SingleTickerProviderStateMixin, UsuarioValidator {
  Usuario usuario;

  _PerfilScreenState({@required this.usuario});

  AnimationController _animationController;
  final _nomeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _nomeController.text = usuario.nome;
  }

  void _onSalvarPerfil() {
    bool isFormValid = _formKey.currentState.validate();
    if (isFormValid) {
      _animationController.forward();

      usuario.nome = _nomeController.text;

      BlocProvider.of<UsuarioBloc>(context)
          .add(AtualizarUsuario(usuario: usuario));
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _nomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UsuarioBloc, UsuarioState>(
      listener: (context, state) {
        if (state is UsuarioAtualizado) {
          showMessage(
            key: _scaffoldKey,
            mensagem: "Perfil atualizado com sucesso.",
          );
          _animationController.reset();
        }

        if (state is UsuarioFailure) {
          showMessage(
            key: _scaffoldKey,
            mensagem: state.erro,
          );
          _animationController.reset();
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(title: Text("Perfil")),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                ImageFormField(
                  context: context,
                  imagem: usuario.foto,
                  size: 96,
                  icon: Icon(Icons.photo_camera, size: 64),
                  onChanged: (imagem) {
                    if (imagem is String) {
                      usuario.foto = imagem;
                    }
                  },
                ),
                TextInput(
                  labelText: "Nome",
                  controller: _nomeController,
                  validator: isValidNome,
                  keyboardType: TextInputType.emailAddress,
                ),
                FlatButton(
                  child: Text(
                    "Alterar Senha",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {},
                ),
                AnimatedButton(
                  text: "SALVAR PERFIL",
                  controller: _animationController.view,
                  primaryColor: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  circularIndicatorProgressColor: Colors.white,
                  onPressed: () {
                    _onSalvarPerfil();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
