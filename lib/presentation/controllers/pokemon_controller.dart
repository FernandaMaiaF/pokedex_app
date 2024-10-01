
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex_app/data/models/pokemon_detail_model.dart';
import 'package:pokedex_app/data/models/pokemon_model.dart';
import 'package:pokedex_app/domain/usecases/get_pokemons_detail_usecase.dart';
import 'package:pokedex_app/domain/usecases/get_pokemons_usecase.dart';

part 'pokemon_controller.g.dart';

class PokemonController = _PokemonControllerBase with _$PokemonController;

abstract class _PokemonControllerBase with Store {
  final GetPokemonsUsecase getPokemonsUsecase;
  final GetPokemonDetailsUseCase getPokemonDetailsUseCase;

  _PokemonControllerBase(this.getPokemonsUsecase, this.getPokemonDetailsUseCase);

  @observable
  ObservableList<PokemonModel> pokemons = ObservableList<PokemonModel>();

  @observable
  ObservableMap<String, PokemonDetailModel> pokemonDetails = ObservableMap<String, PokemonDetailModel>();

  @observable
  ObservableList<PokemonModel> filteredPokemons = ObservableList<PokemonModel>();

  @observable
  bool isLoading = false;

  @observable
  bool isLoadingDetails = false;

  int currentOffset = 0;
  final int limit = 1025;

  @action
  Future<void> getPokemons() async {
    try {
      isLoading = true;
      final result = await getPokemonsUsecase(limit, currentOffset);
      pokemons = ObservableList.of(result);
      filteredPokemons = ObservableList.of(result);

    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> getPokemonDetails(String url) async {
    try {
      isLoadingDetails = true;
      final details = await getPokemonDetailsUseCase(url);
      pokemonDetails[url] = details;
    } catch (e) {
      if(kDebugMode) print(e);
    } finally {
      isLoadingDetails = false;
    }
  }

  @action
  void filterPokemons(String query) {
    if (query.isEmpty) {
      filteredPokemons = ObservableList.of(pokemons);
    } else {
      filteredPokemons = ObservableList.of(
        pokemons.where((pokemon) => pokemon.name.toLowerCase().contains(query.toLowerCase())).toList(),
      );
    }
  }
}
