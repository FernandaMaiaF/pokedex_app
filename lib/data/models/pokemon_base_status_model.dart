class PokemonBaseStatusModel {
  final String name;
  final int status;
  final int effort;

  PokemonBaseStatusModel({required this.name, required this.status, required this.effort});

  factory PokemonBaseStatusModel.fromJson(Map<String, dynamic> json) {
    return PokemonBaseStatusModel(
      name: json['stat']['name'],
      status: json['base_stat'],
      effort: json['effort'],
    );
  }
}
