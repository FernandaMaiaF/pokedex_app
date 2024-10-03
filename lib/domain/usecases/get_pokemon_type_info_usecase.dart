import 'package:pokedex_app/data/models/pokemon_type_info_model.dart';

import '../../data/repositories/pokemon_repository.dart';

class GetPokemonTypeInfoUseCase {
  final PokemonRepository repository;

  GetPokemonTypeInfoUseCase(this.repository);

  Future<PokemonTypeInfoModel> call(String url) async {
    return await repository.getPokemonTypeInfo(url);
  }
}