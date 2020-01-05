import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TabBar tabBar;
  final String titulo;

  CustomAppBar({this.tabBar, this.titulo});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(this.titulo ?? "Millenium"),
      bottom: tabBar,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
      kToolbarHeight + (this.tabBar?.preferredSize?.height ?? 0.0));
}
