// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import 'package:flutter_poxedex_app/consts/app_consts.dart';
import 'package:flutter_poxedex_app/consts/ui_helper.dart';
import 'package:flutter_poxedex_app/model/pokemon_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokeImageAndBall extends StatelessWidget {
  Pokemon pokemon;
  PokeImageAndBall({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(Consts.imageUrl,
                opacity: const AlwaysStoppedAnimation(0.7),
                width: ScreenUtil().orientation == Orientation.portrait
                    ? 0.15.sh
                    : 0.15.sw,
                height: ScreenUtil().orientation == Orientation.portrait
                    ? 0.15.sh
                    : 0.15.sw,
                fit: BoxFit.fitHeight),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: CachedNetworkImage(
              placeholder: (context, url) => CircularProgressIndicator(
                color: UIHelper.getColorFromType(pokemon.type![0]),
              ),
              imageUrl: pokemon.img ?? Consts.imageUrl,
              width: ScreenUtil().orientation == Orientation.portrait
                  ? 0.15.sh
                  : 0.15.sw,
              height: ScreenUtil().orientation == Orientation.portrait
                  ? 0.15.sh
                  : 0.15.sw,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}
