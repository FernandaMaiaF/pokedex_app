import 'package:pokedex_app/data/models/pokemon_type_model.dart';

class PokemonSummaryModel {
  final int id;
  final List<PokemonTypeModel> type;

  PokemonSummaryModel(
      {required this.id,
      required this.type,
    });

  factory PokemonSummaryModel.fromJson(Map<String, dynamic> json) {
    List<PokemonTypeModel> pokemonTypes = [];
    json['types'].forEach((value) {
      pokemonTypes.add(PokemonTypeModel.fromJson(value));
    });
    return PokemonSummaryModel(
      id: json['id'],
      type: pokemonTypes,
    );
  }
}
