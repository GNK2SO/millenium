import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:millenium/src/models/usuario.dart';

class UsuarioRepository {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> efetuarLogin({
    @required String email,
    @required String senha,
  }) {
    return _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: senha)
        .catchError(
      (e) {
        throw Exception("Falha ao autenticar usuário");
      },
    );
  }

  Future<void> salvar(Usuario usuario) {
    UserUpdateInfo _updateData = UserUpdateInfo();
    _updateData.displayName = usuario.nome;
    return _firebaseAuth
        .createUserWithEmailAndPassword(
      email: usuario.email,
      password: usuario.senha,
    )
        .then((result) async {
      await result.user.updateProfile(_updateData);
    }).catchError(
      (e) {
        throw Exception("Falha ao cadastrar usuário");
      },
    );
  }

  Future<void> efetuarLogout() {
    return Future.wait([
      _firebaseAuth.signOut(),
    ]);
  }

  Future<bool> estaAutenticado() async {
    final usuarioAtual = await _firebaseAuth.currentUser();
    return usuarioAtual != null;
  }

  Future<Usuario> obterUsuario() async {
    FirebaseUser usuarioAtual = await _firebaseAuth.currentUser();
    bool isAdmin;
    await Firestore.instance
        .collection("administradores")
        .document(usuarioAtual.uid)
        .get()
        .then(
      (doc) {
        if (doc.data != null) {
          isAdmin = true;
        } else {
          isAdmin = false;
        }
      },
    );

    return Usuario(
      uid: usuarioAtual.uid,
      nome: usuarioAtual.displayName,
      email: usuarioAtual.email,
      isAdmin: isAdmin,
    );
  }
}
