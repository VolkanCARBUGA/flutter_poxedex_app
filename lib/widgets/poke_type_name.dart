// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_poxedex_app/consts/app_consts.dart';
import 'package:flutter_poxedex_app/model/pokemon_model.dart';

class PokemonType extends StatelessWidget {
  Pokemon pokemon;
  PokemonType({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              pokemon.name ?? "N/A",
              style: Consts.getTitleStyle().copyWith(
                  fontSize: 25,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold),
            ),
             Text(
              "${pokemon.num}",
              style: Consts.getTitleStyle().copyWith(
                  fontSize: 25,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Chip(
        backgroundColor: Colors.grey,
          label: Text(
            pokemon.type!.join(" , "),
            style: Consts.getTitleStyle().copyWith(
                color: Colors.white,
                fontSize: 15,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
      
    );
  }
}
