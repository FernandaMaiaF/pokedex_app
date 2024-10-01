import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex_app/data/models/pokemon_model.dart';
import 'package:pokedex_app/main.dart';
import 'package:pokedex_app/presentation/controllers/favorites_store_controller.dart';
import 'package:pokedex_app/presentation/utils/color_pokemon_type.dart';
import 'package:pokedex_app/presentation/utils/string_utils.dart';

class PokemonDetailView extends StatelessWidget {
  static const routName = '/pokemon-detail';
  final FavoritesStore favoritesStore = getIt<FavoritesStore>();

  PokemonDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final PokemonModel pokemon =
        ModalRoute.of(context)!.settings.arguments as PokemonModel;
    String? colorTypeDetail = pokemon.detail?.type[0].name;

    return Scaffold(
        backgroundColor: Color(colorType(colorTypeDetail)),
        appBar: AppBar(
          backgroundColor: Color(colorType(colorTypeDetail)),
          forceMaterialTransparency: true,
          elevation: 0,
          actions: [
            Observer(builder: (_) {
              bool isFavorite = favoritesStore.favorites.contains(pokemon.name);
              return IconButton(
                padding: const EdgeInsets.only(right: 12),
                icon: Icon(
                  isFavorite ? Icons.star : Icons.star_border,
                  color: isFavorite ? Colors.yellow : Colors.white,
                  size: 32,
                ),
                onPressed: () {
                  if (isFavorite) {
                    favoritesStore.removeFavorite(pokemon.name);
                  } else {
                    favoritesStore.addFavorite(pokemon.name);
                  }
                },
              );
            })
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    pokemon.name,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    formattPokedexIndex(pokemon.detail!.id),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Wrap(
                    direction: Axis.horizontal,
                    children: pokemon.detail!.type.map((type) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 12),
                          decoration: BoxDecoration(
                            color: (pokemon.detail!.type[0].name == type.name)
                                ? const Color.fromARGB(32, 255, 255, 255)
                                : Color(colorType(type.name)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            capitalize(type.name),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: Color.fromARGB(209, 255, 255, 255),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Wrap(
              children: [
                Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 255, 255, 255)
                            .withOpacity(0.1),
                      ),
                    ],
                  ),
                  child: Image.network(
                    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemon.detail!.id}.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Expanded(
              child: DefaultTabController(
                length: 4,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(175, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child:  Column(
                    children: [
                      TabBar(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        indicatorWeight: 1,
                        indicatorPadding: const EdgeInsets.all(0),

                        labelPadding: const EdgeInsets.all(0),
                        labelStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                        indicatorColor: Colors.grey[800],
                        labelColor: Colors.grey[800],
                        unselectedLabelColor: Colors.grey[600],
                        tabs: const [
                        Tab(
                          text: 'About',
                        ),
                        Tab(
                          text: 'Base Status',
                        ),

                        Tab(
                          text: 'Evolution',
                        ),
                        Tab(
                          text: 'Moves',
                        ),
                      ]),
                      const Expanded(
                        child: TabBarView(children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('aboult'),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('status'),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('evolution'),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('moves'),
                            ],
                          )
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
