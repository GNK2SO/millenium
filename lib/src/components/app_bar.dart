import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TabBar tabBar;
  final String personagemNome;

  CustomAppBar({this.tabBar, this.personagemNome});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(this.personagemNome ?? "Millenium"),
      bottom: tabBar,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
      kToolbarHeight + (this.tabBar?.preferredSize?.height ?? 0.0));
}
