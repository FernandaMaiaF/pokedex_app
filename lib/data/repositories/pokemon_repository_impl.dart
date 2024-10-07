import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_app/data/models/pokemon_evolution_model.dart';

import 'package:pokedex_app/data/models/pokemon_info_model.dart';
import 'package:pokedex_app/data/models/pokemon_summary_model.dart';
import 'package:pokedex_app/data/models/pokemon_model.dart';
import 'package:pokedex_app/data/models/pokemon_type_info_model.dart';
import 'package:pokedex_app/data/repositories/pokemon_repository.dart';
import 'package:pokedex_app/data/sources/remote/pokemon_detail_evolution_service.dart';
import 'package:pokedex_app/data/sources/remote/pokemon_detail_service.dart';
import 'package:pokedex_app/data/sources/remote/pokemon_detail_type_service.dart';
import 'package:pokedex_app/data/sources/remote/pokemon_service.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final http.Client client;
  final PokemonService pokemonService;
  final PokemonDetailService pokemonSummaryService;
  final PokemonDetailService pokemonDetailService;
  final PokemonDetailTypeService pokemonDetailTypeService;
  final PokemonDetailEvolutionService pokemonEvolutionService;
  
  PokemonRepositoryImpl(this.client, this.pokemonService, this.pokemonSummaryService, this.pokemonDetailService, this.pokemonDetailTypeService, this.pokemonEvolutionService);

  @override
  Future<List<PokemonModel>> getPokemons(int limit, int offset) async {
    try {
      List<PokemonModel> pokemons = await pokemonService.getPokemon(limit, offset);
      return pokemons;
    } catch (e) {
      if (kDebugMode) {
        print('Failed to get pokemons: $e');
      }
      throw Exception('Failed to get Pokémons list');
    }
  }

  @override
  Future<PokemonSummaryModel> getPokemonSummary(String url) async {
    try {
      PokemonSummaryModel summaryDetail = await pokemonSummaryService.getPokemonSummary(url);
      return summaryDetail;
    } catch (e) {
      if (kDebugMode) {
        print('Failed to get pokemons: $e');
      }
      throw Exception('Failed to get Pokémon summary');
    }
  }

  @override
  Future<PokemonInfoModel> getPokemonInfo(String url) async {
    try {
      PokemonInfoModel userData = await pokemonDetailService.getPokemonInfo(url);
      return userData;
    } catch (e) {
      if (kDebugMode) {
        print('Failed to get pokemons: $e');
      }
      throw Exception('Failed to get Pokémon summary');
    }
  }

  @override
  Future<PokemonTypeInfoModel> getPokemonTypeInfo(String url) async {
    try {
      PokemonTypeInfoModel typeInfo = await pokemonDetailTypeService.getPokemonTypeInfo(url);
      return typeInfo;
    } catch (e) {
      if (kDebugMode) {
        print('Failed to get pokemons: $e');
      }
      throw Exception('Failed to get Pokémon type info');
    }
  }


  @override
  Future<PokemonEvolutionModel> getPokemonEvolution(String url) async {
    try {
      PokemonEvolutionModel typeInfo = await pokemonEvolutionService.getPokemonEvolution(url);
      
      return typeInfo;
    } catch (e) {
      if (kDebugMode) {
        print('Failed to get pokemons: $e');
      }
      throw Exception('Failed to get Pokémon evolution');
    }
  }
}
