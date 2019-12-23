import 'package:flutter/material.dart';
import 'package:millenium/src/models/usuario.dart';
import 'package:millenium/src/repository/bestiario_repository.dart';
import 'package:millenium/src/repository/usuario_repository.dart';
import 'package:millenium/src/screens/alterar_senha/alterar_senha_screen.dart';
import 'package:millenium/src/screens/bestiario/bestiario_screen.dart';
import 'package:millenium/src/screens/cadastro/cadastro_screen.dart';
import 'package:millenium/src/screens/classes_screen/classes_screen.dart';
import 'package:millenium/src/screens/login/login_screen.dart';
import 'package:millenium/src/screens/meus_personagens_screen/meus_personagens_screen.dart';
import 'package:millenium/src/screens/perfil/perfil_screen.dart';
import 'package:millenium/src/screens/regras_screen/regras_screen.dart';
import 'package:millenium/src/screens/todos_personagens/todos_personagens_screen.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> getRoutes(Usuario usuario) {
    return {
      "/regrasScreen": (context) => RegrasScreen(usuario: usuario),
      "/classesScreen": (context) => ClassesScreen(usuario: usuario),
      "/perfilScreen": (context) => PerfilScreen(usuario: usuario),
      "/alterarSenhaScreen": (context) => AlterarSenhaScreen(),
      "/loginScreen": (context) => LoginScreen(repository: UsuarioRepository()),
      "/cadastroContaScreen": (context) =>
          CadastroScreen(repository: UsuarioRepository()),
      "/meusPersonagensScreen": (context) =>
          MeusPersonagensScreen(usuario: usuario),
      "/todosPersonagemScreen": (context) =>
          TodosPersonagensScreen(usuario: usuario),
      "/bestiarioScreen": (context) =>
          BestiarioScreen(usuario: usuario, repository: BestiarioRepository()),
    };
  }
}
