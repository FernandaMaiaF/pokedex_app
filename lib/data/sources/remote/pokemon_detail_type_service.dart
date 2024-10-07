
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex_app/data/models/pokemon_type_info_model.dart';

class PokemonDetailTypeService {
  final http.Client client;

  PokemonDetailTypeService({required this.client});

  Future<PokemonTypeInfoModel> getPokemonTypeInfo(String url) async {
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return PokemonTypeInfoModel.fromJson(json.decode(response.body)['damage_relations']);
    } else {
      throw Exception('Failed to load Pokémon type info');
    }
  }
}