
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex_app/data/models/pokemon_model.dart';

class PokemonService {
  final http.Client client;

  PokemonService({required this.client});

   Future<List<PokemonModel>> getPokemon(int limit, int offset) async {
    final response = await client.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=$offset'));
    if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body)['results'];
    final pokemons = data.map((json) => PokemonModel.fromJson(json)).toList();

    return pokemons;
    } else {
      throw Exception('Failed to load pokemon');
    }
  }
}