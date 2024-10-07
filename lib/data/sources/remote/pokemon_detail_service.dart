
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex_app/data/models/pokemon_info_model.dart';
import 'package:pokedex_app/data/models/pokemon_summary_model.dart';

class PokemonDetailService {
  final http.Client client;

  PokemonDetailService({required this.client});

  Future<PokemonSummaryModel> getPokemonSummary(String url) async {
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return PokemonSummaryModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Pokémon summary');
    }
  }

  Future<PokemonInfoModel> getPokemonInfo(String url) async {
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return PokemonInfoModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Pokémon summary');
    }
  }
}