
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex_app/data/models/pokemon_evolution_model.dart';

class PokemonDetailEvolutionService {
  final http.Client client;

  PokemonDetailEvolutionService({required this.client});

  Future<PokemonEvolutionModel> getPokemonEvolution(String url) async {
final String urlEvolution = await getEvolutionChainUrl(url);  
    final response = await client.get(Uri.parse(urlEvolution));
    if (response.statusCode == 200) {
      final evolutions = PokemonEvolutionModel.fromJson(json.decode(response.body)['chain']);
      return evolutions;
    } else {
      throw Exception('Failed to load evolution chain');
    }
  }

  Future<String> getEvolutionChainUrl(String urlspecies) async {
    final url = Uri.parse(urlspecies);
    final response = await client.get(url);
    if (response.statusCode == 200) {
      final dynamic data = json.decode(response.body)['evolution_chain'];
      final evolutions = data['url'];

      return evolutions;
    } else {
      throw Exception('Failed to load evolution chain');
    }
  }
}