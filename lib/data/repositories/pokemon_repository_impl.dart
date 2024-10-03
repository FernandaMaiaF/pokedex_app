import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_app/data/models/pokemon_info_model.dart';
import 'package:pokedex_app/data/models/pokemon_summary_model.dart';

import 'package:pokedex_app/data/models/pokemon_model.dart';
import 'package:pokedex_app/data/models/pokemon_type_info_model.dart';
import 'package:pokedex_app/data/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final http.Client client;

  PokemonRepositoryImpl(this.client);

  @override
  Future<List<PokemonModel>> getPokemons(int limit, int offset) async {
    final url = Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=$offset');
    if (kDebugMode) {
      print('Fetching pokemons from: $url');
    }
    final response = await client.get(url);
    final List<dynamic> data = json.decode(response.body)['results'];

    final pokemons = data.map((json) => PokemonModel.fromJson(json)).toList();

    return pokemons;
  }

  @override
  Future<PokemonSummaryModel> getPokemonSummary(String url) async {
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return PokemonSummaryModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Pokémon summary');
    }
  }


  @override
  Future<PokemonInfoModel> getPokemonInfo(String url) async {
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return PokemonInfoModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Pokémon summary');
    }
  }


  @override
  Future<PokemonTypeInfoModel> getPokemonTypeInfo(String url) async {
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {

      return PokemonTypeInfoModel.fromJson(json.decode(response.body)['damage_relations']);
    } else {
      throw Exception('Failed to load Pokémon type info');
    }
  }
}
