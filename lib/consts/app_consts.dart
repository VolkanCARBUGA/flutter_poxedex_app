import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Consts {
  Consts._();
  static const String url =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  static const String title = "Pokedex APP";
   static const imageUrl = "assets/images/pokeball.png";
  static TextStyle getTitleStyle() {
    return GoogleFonts.tiltNeon(
      fontSize: _calculateFontSize( 40),
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }

  static _calculateFontSize(int size) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size.sp;
    }else {
      return size.sw;
    }
    
  }
}
