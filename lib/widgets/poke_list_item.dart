// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_poxedex_app/consts/app_consts.dart';
import 'package:flutter_poxedex_app/consts/ui_helper.dart';
import 'package:flutter_poxedex_app/model/pokemon_model.dart';
import 'package:flutter_poxedex_app/pages/deatil_page.dart';
import 'package:flutter_poxedex_app/widgets/poke_image_and_ball.dart';


class PokeListItem extends StatelessWidget {
  Pokemon pokemon;
  PokeListItem({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(
                      pokemon: pokemon,
                    )));
      },
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
          elevation: 10,
          shadowColor: Colors.black,
          color: UIHelper.getColorFromType(pokemon.type![0]),
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pokemon.name ?? "N/A",
                    style: Consts.getTitleStyle().copyWith(
                      color: Colors.white,
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Chip(
                      backgroundColor: Colors.red,
                      label: Text(
                        pokemon.type![0],
                        style: Consts.getTitleStyle().copyWith(
                          color: Colors.white,
                          fontSize: 15,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  PokeImageAndBall(pokemon: pokemon),
                
                ],
              ),
            ),
          )),
    );
  }
}
