import 'package:flutter/material.dart';
import 'package:millenium/src/components/app_bar.dart';
import 'package:millenium/src/screens/classes/asssassino_screen.dart';
import 'package:millenium/src/screens/classes/barbaro_screen.dart';
import 'package:millenium/src/screens/classes/cacador_screen.dart';
import 'package:millenium/src/screens/classes/guerreiro_screen.dart';
import 'package:millenium/src/screens/classes/mago_screen.dart';

class ClassesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: CustomAppBar(
          tabBar: TabBar(
            tabs: <Widget>[
              Tab(
                text: "Guerreiro",
              ),
              Tab(
                text: "Caçador",
              ),
              Tab(
                text: "Bárbaro",
              ),
              Tab(
                text: "Assassino",
              ),
              Tab(
                text: "Mago",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            GuerreiroScreen(),
            CacadorScreen(),
            BarbaroScreen(),
            AssassinoScreen(),
            MagoScreen(),
          ],
        ),
      ),
    );
  }
}
