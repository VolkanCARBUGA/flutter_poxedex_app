import 'package:flutter/material.dart';
import 'package:flutter_poxedex_app/model/pokemon_model.dart';
import 'package:flutter_poxedex_app/services/api_services.dart';
import 'package:flutter_poxedex_app/widgets/poke_list_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<Pokemon>> pokemonList;
  @override
  void initState() {
    pokemonList = PokomonApi.getPokemonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: pokemonList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            return Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: data!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        ScreenUtil().orientation == Orientation.portrait
                            ? 2
                            : 3),
                itemBuilder: (context, index) {
                  var pokemon = data[index];
                  return PokeListItem(pokemon: pokemon);
                },
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
