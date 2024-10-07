import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

import 'package:pokedex_app/data/models/pokemon_evolution_model.dart';
import 'package:pokedex_app/data/models/pokemon_type_info_model.dart';
import 'package:pokedex_app/domain/usecases/get_pokemon_evolution_usecase.dart';

part 'pokemon_evolution_controller.g.dart';

class PokemonEvolutionController = _PokemonEvolutionController
    with _$PokemonEvolutionController;

abstract class _PokemonEvolutionController with Store {
  final GetPokemonEvolutionUseCase _pokemonRepository;

  _PokemonEvolutionController(this._pokemonRepository);

  @observable
  PokemonEvolutionModel? pokemonEvolution;

  @observable
  ObservableList<PokemonTypeInfoModel> typeDetails =
      ObservableList<PokemonTypeInfoModel>();

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  Future<void> getPokemonWithEvolution(String urlChain) async {
    try {
      pokemonEvolution = await _pokemonRepository.call(urlChain);
    } catch (error) {
      if (kDebugMode) print(error);
      throw Exception('Failed to get Pokemon evolution');
    }
  }
}
