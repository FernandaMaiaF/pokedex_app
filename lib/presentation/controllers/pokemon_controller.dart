
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex_app/data/models/pokemon_info_model.dart';
import 'package:pokedex_app/data/models/pokemon_summary_model.dart';
import 'package:pokedex_app/data/models/pokemon_model.dart';
import 'package:pokedex_app/data/models/pokemon_type_info_model.dart';
import 'package:pokedex_app/domain/usecases/get_pokemon_info_usecase.dart';
import 'package:pokedex_app/domain/usecases/get_pokemon_summary_usecase.dart';
import 'package:pokedex_app/domain/usecases/get_pokemon_type_info_usecase.dart';
import 'package:pokedex_app/domain/usecases/get_pokemons_usecase.dart';

part 'pokemon_controller.g.dart';

class PokemonController = _PokemonControllerBase with _$PokemonController;

abstract class _PokemonControllerBase with Store {
  final GetPokemonsUsecase getPokemonsUsecase;
  final GetPokemonSummaryUseCase getPokemonSummaryUseCase;
  final GetPokemonInfoUseCase getPokemonInfoUseCase;
  final GetPokemonTypeInfoUseCase getPokemonTypeInfoUseCase;
  

  _PokemonControllerBase(this.getPokemonsUsecase, this.getPokemonSummaryUseCase, this.getPokemonInfoUseCase, this.getPokemonTypeInfoUseCase);

  @observable
  ObservableList<PokemonModel> pokemons = ObservableList<PokemonModel>();

  @observable
  ObservableMap<String, PokemonSummaryModel> pokemonDetails = ObservableMap<String, PokemonSummaryModel>();

  @observable
  ObservableList<PokemonModel> filteredPokemons = ObservableList<PokemonModel>();

  @observable
  ObservableMap<String, PokemonInfoModel> pokemonInfo = ObservableMap<String, PokemonInfoModel>();

  @observable
  ObservableMap<String, PokemonTypeInfoModel> pokemonInfoType = ObservableMap<String, PokemonTypeInfoModel>();

  @observable
  bool isLoading = false;

  @observable
  bool isLoadingDetails = false;

  @observable
  bool isLoadingInfo = false;

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
  Future<void> getPokemonSummary(String url) async {
    try {
      isLoadingDetails = true;
      final details = await getPokemonSummaryUseCase(url);
      pokemonDetails[url] = details;
    } catch (e) {
      if(kDebugMode) print(e);
    } finally {
      isLoadingDetails = false;
    }
  }


  @action
  Future<void> getPokemonInfo(String url) async {
    try {
      isLoadingInfo = true;
      final info = await getPokemonInfoUseCase(url);
      pokemonInfo[url] = info;
    } catch (e) {
      if(kDebugMode) print(e);
    } finally {
      isLoadingInfo = false;
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


  @action
  Future<void> getPokemonTypeInfo(String url) async {
    try {
      isLoadingInfo = true;
      final infoType = await getPokemonTypeInfoUseCase(url);
      pokemonInfoType[url] = infoType;
    } catch (e) {
      if(kDebugMode) print(e);
    } finally {
      isLoadingInfo = false;
    }
  }
}
