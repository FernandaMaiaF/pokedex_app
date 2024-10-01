import 'package:pokedex_app/data/models/pokemon_model.dart';
import 'package:pokedex_app/data/repositories/pokemon_repository.dart';

class GetPokemonsUsecase {
  final PokemonRepository repository;

  GetPokemonsUsecase(this.repository);

  Future<List<PokemonModel>> call(int limit, int offset) async {
    return await repository.getPokemons(limit, offset);
  }
}