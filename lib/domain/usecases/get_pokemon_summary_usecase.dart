import '../../data/repositories/pokemon_repository.dart';
import '../../data/models/pokemon_summary_model.dart';

class GetPokemonSummaryUseCase {
  final PokemonRepository repository;

  GetPokemonSummaryUseCase(this.repository);

  Future<PokemonSummaryModel> call(String url) async {
    return await repository.getPokemonSummary(url);
  }
}