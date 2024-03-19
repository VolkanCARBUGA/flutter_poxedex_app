import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_poxedex_app/consts/app_consts.dart';
import 'package:flutter_poxedex_app/model/pokemon_model.dart';

class PokomonApi {
  

  static Future<List<Pokemon>> getPokemonData() async {
    var dio=Dio();
    var response= await dio.get(Consts.url);
    var result=jsonDecode(response.data)['pokemon'] as List;
    List<Pokemon> list=result.map((e) => Pokemon.fromJson(e)).toList();
    return list;
   
  }
}