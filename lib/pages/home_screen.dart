// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_poxedex_app/widgets/app_title.dart';
import 'package:flutter_poxedex_app/widgets/pokemon_list.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: OrientationBuilder(
      builder: (context, orientation) => const Column(
        children: [
          Center(child: AppTitle()),
          PokemonList(),
        ],
      ),
    ));
  }
}
