import 'package:pokedex_app/presentation/utils/string_utils.dart';

class PokemonTypeModel {
  final String name;
  final String url;

  PokemonTypeModel({required this.name, required this.url});

  factory PokemonTypeModel.fromJson(Map<String, dynamic> json) {
    return PokemonTypeModel(
      name: capitalize(json['type']['name']),
      url: json['type']['url'],
    );
  }
}
