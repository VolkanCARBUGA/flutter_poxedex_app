// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_poxedex_app/consts/app_consts.dart';

import 'package:flutter_poxedex_app/consts/ui_helper.dart';

import 'package:flutter_poxedex_app/model/pokemon_model.dart';
import 'package:flutter_poxedex_app/widgets/poke_image_and_ball.dart';

import 'package:flutter_poxedex_app/widgets/poke_info.dart';
import 'package:flutter_poxedex_app/widgets/poke_type_name.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailPage extends StatelessWidget {
  Pokemon pokemon;
  DetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return ScreenUtil().orientation == Orientation.portrait
        ? BuildPortraitBody(pokemon: pokemon)
        : buildLandscapeBody(context);
  }

  Scaffold buildLandscapeBody(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios)),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PokemonType(pokemon: pokemon),
                        Expanded(
                          child: Hero(
                              tag: pokemon.id!,
                              child: CachedNetworkImage(
                                imageUrl: pokemon.img ?? '',
                                height: 0.25.sh,
                                fit: BoxFit.fitHeight,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Expanded(flex: 3, child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PokeInfo(pokemon: pokemon),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
    );
  }
}

class BuildPortraitBody extends StatelessWidget {
  const BuildPortraitBody({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              iconSize: 24.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          PokemonType(pokemon: pokemon),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
              child: Stack(
            children: [
              Positioned(
                  top: 0,
                  right: 0,
                  child: Image.asset(
                    Consts.imageUrl,
                    height: 0.15.sh,
                    fit: BoxFit.fitHeight,
                    opacity: const AlwaysStoppedAnimation(0.7),
                  )),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  top: 0.15.sh,
                  child: PokeInfo(pokemon: pokemon)),
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                    tag: pokemon.id!,
                    child: CachedNetworkImage(
                      imageUrl: pokemon.img ?? '',
                      height: 0.25.sh,
                      fit: BoxFit.fitHeight,
                    )),
              )
            ],
          )),
        ],
      )),
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
    );
  }
}
