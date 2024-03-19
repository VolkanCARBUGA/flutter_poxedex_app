// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_poxedex_app/consts/app_consts.dart';
import 'package:flutter_poxedex_app/model/pokemon_model.dart';

class PokeInfo extends StatelessWidget {
  Pokemon pokemon;
  PokeInfo({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(child: _buildPokemonInfo("Name", pokemon.name)),
                Expanded(child: _buildPokemonInfo("Height", pokemon.height)),
                Expanded(child: _buildPokemonInfo("Weight", pokemon.weight)),
                Expanded(child: _buildPokemonInfo("Spawn Time", pokemon.spawnTime)),
                Expanded(child: _buildPokemonInfo("Weakness", pokemon.weaknesses)),
                Expanded(child: _buildPokemonInfo("Pro Evolution", pokemon.prevEvolution)),
                Expanded(child: _buildPokemonInfo("Next ", pokemon.nextEvolution))
              ]),
        ));
  }

  Widget _buildPokemonInfo(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: Consts.getTitleStyle().copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontStyle: FontStyle.italic)),
        if (value is List && value.isNotEmpty)
          Text(value.join(' , '),
              style: Consts.getTitleStyle().copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontStyle: FontStyle.italic))
        else if (value == null)
          Text('Not available',
              style: Consts.getTitleStyle().copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontStyle: FontStyle.italic))
        else
          Text(value.toString(),
              style: Consts.getTitleStyle().copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontStyle: FontStyle.italic)),
      ],
    );
  }
}
