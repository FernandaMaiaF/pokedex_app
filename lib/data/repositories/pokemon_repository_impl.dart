import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_app/data/models/pokemon_detail_model.dart';

import 'package:pokedex_app/data/models/pokemon_model.dart';
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
  Future<PokemonDetailModel> getPokemonDetails(String url) async {
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return PokemonDetailModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Pokémon details');
    }
  }
}
