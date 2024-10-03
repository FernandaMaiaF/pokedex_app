import 'package:pokedex_app/data/models/pokemon_info_model.dart';
import 'package:pokedex_app/data/models/pokemon_summary_model.dart';
import 'package:pokedex_app/data/models/pokemon_type_info_model.dart';

import '../models/pokemon_model.dart';

abstract class PokemonRepository {
  Future<List<PokemonModel>> getPokemons(int limit, int offset);
  Future<PokemonSummaryModel> getPokemonSummary(String url);
  Future<PokemonInfoModel> getPokemonInfo(String url);
  Future<PokemonTypeInfoModel> getPokemonTypeInfo(String url);
}