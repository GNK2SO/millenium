import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TabBar tabBar;
  final String titulo;
  final List<Widget> actions;

  CustomAppBar({this.tabBar, this.titulo, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(this.titulo ?? "Millenium"),
      bottom: tabBar,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
      kToolbarHeight + (this.tabBar?.preferredSize?.height ?? 0.0));
}
