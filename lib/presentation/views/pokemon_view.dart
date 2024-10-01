import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'package:pokedex_app/presentation/controllers/pokemon_controller.dart';
import 'package:pokedex_app/presentation/utils/color_pokemon_type.dart';
import 'package:pokedex_app/presentation/utils/string_utils.dart';
import 'package:pokedex_app/presentation/views/pokemon_detail_view.dart';

class PokemonView extends StatelessWidget {
  static const routeName = '/pokemon-list';

  final PokemonController controller = GetIt.instance<PokemonController>();
  final TextEditingController _searchController = TextEditingController();

  PokemonView({super.key}) {
    controller.getPokemons();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokédex"),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                fillColor: Colors.grey.shade300,
                filled: true,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    controller.filterPokemons('');
                  },
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Buscar Pokémon',
              ),
              onChanged: (value) => controller.filterPokemons(value),
            ),
          ),
          Expanded(
            child: Observer(
              builder: (_) {
                if (controller.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (controller.filteredPokemons.isEmpty) {
                  return const Center(child: Text('Nenhum Pokémon encontrado'));
                } else {
                  return GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, mainAxisExtent: 135),
                    itemCount: controller.filteredPokemons.length,
                    itemBuilder: (context, index) {
                      final pokemon = controller.filteredPokemons[index];
                      return Observer(builder: (_) {
                        final details = controller.pokemonDetails[pokemon.url];
                        if (details == null) {
                          controller.getPokemonDetails(pokemon.url);
                          return ListTile(
                            title: Text(pokemon.name),
                            trailing: const CircularProgressIndicator(),
                          );
                        } else {
                          return GestureDetector(
                            onTap: () {
                              pokemon.setDetail(details);
                              if (pokemon.detail != null) {
                                Navigator.pushNamed(
                                  context,
                                  PokemonDetailView.routName,
                                  arguments: pokemon,
                                );
                              }
                            },
                            child: Card(
                              elevation: 0,
                              color: Color(colorType(details.type[0].name)),
                              child: Stack(
                                alignment: AlignmentDirectional.topEnd,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                pokemon.name,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Wrap(
                                                spacing: 1,
                                                direction: Axis.vertical,
                                                children:
                                                    details.type.map((type) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 4,
                                                          horizontal: 12),
                                                      decoration: BoxDecoration(
                                                        color: (details.type[0]
                                                                    .name ==
                                                                type.name)
                                                            ? const Color
                                                                .fromARGB(32,
                                                                255, 255, 255)
                                                            : Color(colorType(
                                                                type.name)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      child: Text(
                                                        capitalize(type.name),
                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          color: Color.fromARGB(
                                                              209,
                                                              255,
                                                              255,
                                                              255),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          formattPokedexIndex(details.id),
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800,
                                            color: Color.fromARGB(72, 0, 0, 0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: Image.network(
                                      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${details.id}.png',
                                      scale: 5.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      });
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
