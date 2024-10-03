import 'package:pokedex_app/data/models/pokemon_base_status_model.dart';
import 'package:pokedex_app/data/models/pokemon_type_model.dart';

class PokemonInfoModel {
  final int id;
  final int baseExperience;
  final List<PokemonTypeModel> type;
  final List<PokemonBaseStatusModel> baseStatus;
  final int weight;
  final int height;

  PokemonInfoModel(
      {required this.id,
      required this.baseExperience,
      required this.baseStatus,
      required this.type,
      required this.weight,
      required this.height,
    });

  factory PokemonInfoModel.fromJson(Map<String, dynamic> json) {
    List<PokemonTypeModel> pokemonTypes = [];
    List<PokemonBaseStatusModel> pokemonBaseStatus = [];
    json['types'].forEach((value) {
      pokemonTypes.add(PokemonTypeModel.fromJson(value));
    });
    json['stats'].forEach((value) {
      pokemonBaseStatus.add(PokemonBaseStatusModel.fromJson(value));
    });
    return PokemonInfoModel(
      id: json['id'],
      baseExperience: json['base_experience'],
      weight: json['weight'],
      height: json['height'],
      type: pokemonTypes,
      baseStatus: pokemonBaseStatus,
    );
  }
}
