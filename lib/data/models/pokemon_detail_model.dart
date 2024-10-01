import 'package:pokedex_app/data/models/pokemon_type_model.dart';

class PokemonDetailModel {
  final int id;
  final int baseExperience;
  final List<PokemonTypeModel> type;
  final int weight;

  PokemonDetailModel({required this.id, required this.baseExperience,required this.type, required this.weight});

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) {
    List<PokemonTypeModel> pokemonTypes = [];
    json['types'].forEach((value) {
      pokemonTypes.add(PokemonTypeModel.fromJson(value));
    });
    return PokemonDetailModel(
      id: json['id'],
      baseExperience: json['base_experience'],
      weight: json['weight'],
      type: pokemonTypes,
    );
  }
}
