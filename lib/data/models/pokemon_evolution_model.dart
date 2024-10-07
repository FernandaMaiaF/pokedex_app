class PokemonEvolutionModel {
  final String? nameEvol1;
  final String? urlSpeciesEvol1;
  final String? nameEvol2;
  final String? urlSpeciesEvol2;
  final String? nameEvol3;
  final String? urlSpeciesEvol3;



  PokemonEvolutionModel({required this.nameEvol1,required this.urlSpeciesEvol1,required this.nameEvol2,required this.urlSpeciesEvol2,required this.nameEvol3,required this.urlSpeciesEvol3});
  factory PokemonEvolutionModel.fromJson(Map<String, dynamic> json) {

    return PokemonEvolutionModel(
      nameEvol1: json['species']['name'],
      urlSpeciesEvol1: json['species']['url'],
      nameEvol2: json['evolves_to'][0]['species']['name'],
      urlSpeciesEvol2: json['evolves_to'][0]['species']['url'],
      nameEvol3: json['evolves_to'][0]['evolves_to'][0]['species']['name'],
      urlSpeciesEvol3: json['evolves_to'][0]['evolves_to'][0]['species']['url'],
    );
  }
}