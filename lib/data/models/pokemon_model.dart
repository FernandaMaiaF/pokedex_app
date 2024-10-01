import 'package:pokedex_app/data/models/pokemon_detail_model.dart';
import 'package:pokedex_app/presentation/utils/string_utils.dart';

class PokemonModel {
  final String name;
  final String url;
  PokemonDetailModel? detail;

  PokemonModel({required this.name, required this.url, this.detail});

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      name: capitalize(json['name']),
      url: json['url'],
    );
  }

  void setDetail(PokemonDetailModel detail) {
    this.detail = detail;
  }
}
