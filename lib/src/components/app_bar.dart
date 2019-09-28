import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  TabBar tabBar;

  CustomAppBar({this.tabBar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Millenium",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'pentagrams_malefissent',
          fontSize: 24,
        ),
      ),
      bottom: tabBar,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
      kToolbarHeight + (this.tabBar?.preferredSize?.height ?? 0.0));
}
