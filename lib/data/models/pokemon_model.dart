import 'package:pokedex_app/data/models/pokemon_info_model.dart';
import 'package:pokedex_app/data/models/pokemon_summary_model.dart';
import 'package:pokedex_app/presentation/utils/string_utils.dart';

class PokemonModel {
  final String name;
  final String url;
  PokemonSummaryModel? summary;
  PokemonInfoModel? info;

  PokemonModel({required this.name, required this.url, this.summary});

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      name: capitalize(json['name']),
      url: json['url'],
    );
  }

  void setSummary(PokemonSummaryModel summary) {
    this.summary = summary;
  }

  void setInfo(PokemonInfoModel info) {
    this.info = info;
  }
}
