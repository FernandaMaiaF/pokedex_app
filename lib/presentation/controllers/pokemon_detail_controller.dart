import 'package:mobx/mobx.dart';
import 'package:pokedex_app/data/models/pokemon_info_model.dart';
import 'package:pokedex_app/data/models/pokemon_type_info_model.dart';
import 'package:pokedex_app/data/models/pokemon_type_model.dart';
import 'package:pokedex_app/data/repositories/pokemon_repository.dart';

part 'pokemon_detail_controller.g.dart';

class PokemonDetailController = _PokemonDetailController with _$PokemonDetailController;

abstract class _PokemonDetailController with Store {
  final PokemonRepository _pokemonRepository;

  _PokemonDetailController(this._pokemonRepository);

  @observable
  PokemonInfoModel? pokemonDetail;

  @observable
  ObservableList<PokemonTypeInfoModel> typeDetails = ObservableList<PokemonTypeInfoModel>();

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  Future<void> loadPokemonDetail(String urlPokemon) async {
    try {
      isLoading = true;
      errorMessage = null;
      pokemonDetail = await _pokemonRepository.getPokemonInfo(urlPokemon);
      if (pokemonDetail != null) {
        await Future.forEach(pokemonDetail!.type, (PokemonTypeModel type) async {
          final typeDetail = await _pokemonRepository.getPokemonTypeInfo(type.url);
          type.setInfoType(typeDetail);
        });
      }
    } catch (error) {
      errorMessage = "Erro ao carregar os detalhes do Pokémon.";
    } finally {
      isLoading = false;
    }
  }
}
