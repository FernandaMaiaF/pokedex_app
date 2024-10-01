import 'package:pokedex_app/data/models/pokemon_detail_model.dart';

import '../models/pokemon_model.dart';

abstract class PokemonRepository {
  Future<List<PokemonModel>> getPokemons(int limit, int offset);
  Future<PokemonDetailModel> getPokemonDetails(String url);
}