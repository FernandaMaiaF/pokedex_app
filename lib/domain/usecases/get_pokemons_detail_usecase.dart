// lib/domain/usecases/get_pokemon_details_usecase.dart

import '../../data/repositories/pokemon_repository.dart';
import '../../data/models/pokemon_detail_model.dart';

class GetPokemonDetailsUseCase {
  final PokemonRepository repository;

  GetPokemonDetailsUseCase(this.repository);

  Future<PokemonDetailModel> call(String url) async {
    return await repository.getPokemonDetails(url);
  }
}