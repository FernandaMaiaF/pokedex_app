import 'package:pokedex_app/data/models/pokemon_info_model.dart';

import '../../data/repositories/pokemon_repository.dart';

class GetPokemonInfoUseCase {
  final PokemonRepository repository;

  GetPokemonInfoUseCase(this.repository);

  Future<PokemonInfoModel> call(String url) async {
    return await repository.getPokemonInfo(url);
  }
}