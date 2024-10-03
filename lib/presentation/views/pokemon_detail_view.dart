import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_app/data/models/pokemon_info_model.dart';
import 'package:pokedex_app/data/models/pokemon_model.dart';
import 'package:pokedex_app/main.dart';
import 'package:pokedex_app/presentation/controllers/favorites_store_controller.dart';
import 'package:pokedex_app/presentation/controllers/pokemon_detail_controller.dart';
import 'package:pokedex_app/presentation/utils/color_pokemon_type.dart';
import 'package:pokedex_app/presentation/utils/string_utils.dart';
import 'package:pokedex_app/presentation/views/widgets/type_effect_row_widget.dart';

class PokemonDetailView extends StatelessWidget {
  static const routName = '/pokemon-detail';
  final FavoritesStore favoritesStore = getIt<FavoritesStore>();
  final PokemonDetailController pokemonDetailController =
      GetIt.I<PokemonDetailController>();

  PokemonDetailView({super.key});


  @override
  Widget build(BuildContext context) {
    final PokemonModel pokemon =
        ModalRoute.of(context)!.settings.arguments as PokemonModel;
    String? colorTypeDetail = pokemon.summary?.type[0].name;
    pokemonDetailController.loadPokemonDetail(pokemon.url);

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
                    formattPokedexIndex(pokemon.summary!.id),
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
                  TypeEffectRow(types: pokemon.summary!.type.map((value) => value.name).toList(),),
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
                    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemon.summary!.id}.png',
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
                  child: Observer(builder: (_) {
                    if (pokemonDetailController.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (pokemonDetailController.errorMessage != null) {
                      return Center(
                          child: Text(
                              'Erro: ${pokemonDetailController.errorMessage}'));
                    }

                    final PokemonInfoModel? pokemonInfo =
                        pokemonDetailController.pokemonDetail;
                    if (pokemonInfo == null) {
                      return const Center(
                          child: Text('Detalhes do Pokémon não disponíveis.'));
                    }
                    return Column(
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
                        Expanded(
                          child: TabBarView(children: [
                            SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'Height',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Text(
                                                'Weight',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                pokemonInfo.height.toString(),
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Text(
                                                '${pokemonInfo.weight / 10} Kg',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Divider(),
                                    TypeEffectRow(
                                      label: 'Double Damage To',
                                      types: pokemonInfo.type
                                          .expand((value) =>
                                              value.infoType?.doubleDemageTo ??
                                              [])
                                          .cast<String>()
                                          .toList(),
                                    ),
                                    TypeEffectRow(
                                      label: 'Half Damage To',
                                      types: pokemonInfo.type
                                          .expand((value) =>
                                              value.infoType?.halfDemageTo ??
                                              [])
                                          .cast<String>()
                                          .toList(),
                                    ),
                                    TypeEffectRow(
                                      label: 'Immune to damage',
                                      types: pokemonInfo.type
                                          .expand((value) =>
                                              value.infoType?.noDemageTo ?? [])
                                          .cast<String>()
                                          .toList(),
                                    ),
                                    TypeEffectRow(
                                      label: 'Double Damage From',
                                      types: pokemonInfo.type
                                          .expand((value) =>
                                              value
                                                  .infoType?.doubleDemageFrom ??
                                              [])
                                          .cast<String>()
                                          .toList(),
                                    ),
                                    TypeEffectRow(
                                      label: 'Half Damage From',
                                      types: pokemonInfo.type
                                          .expand((value) =>
                                              value.infoType?.halfDemageFrom ??
                                              [])
                                          .cast<String>()
                                          .toList(),
                                    ),
                                    TypeEffectRow(
                                      label: 'Immune To Damage From',
                                      types: pokemonInfo.type
                                          .expand((value) =>
                                              value.infoType?.noDemageFrom ??
                                              [])
                                          .cast<String>()
                                          .toList(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: pokemonInfo.baseStatus.length,
                                  itemBuilder: (ctx, i) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 24),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            capitalize(
                                                pokemonInfo.baseStatus[i].name),
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            pokemonInfo.baseStatus[i].status
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                            const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('evolution'),
                              ],
                            ),
                            const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('moves'),
                              ],
                            )
                          ]),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ],
        ));
  }
}
