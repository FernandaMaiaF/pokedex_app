import 'package:pokedex_app/data/models/pokemon_evolution_model.dart';

import '../../data/repositories/pokemon_repository.dart';

class GetPokemonEvolutionUseCase {
  final PokemonRepository repository;

  GetPokemonEvolutionUseCase(this.repository);

  Future<PokemonEvolutionModel> call(String url) async {
    PokemonEvolutionModel typeInfo = await repository.getPokemonEvolution(url);
  
    return typeInfo;
  }
}