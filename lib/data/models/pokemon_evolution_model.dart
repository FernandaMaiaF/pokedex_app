class PokemonEvolutionModel {
  final String? nameEvol1;
  final String? urlSpeciesEvol1;
  final int? minLevelEvol1;
  final String? nameEvol2;
  final String? urlSpeciesEvol2;
  final int? minLevelEvol2;
  final String? nameEvol3;
  final String? urlSpeciesEvol3;

  PokemonEvolutionModel({
    required this.nameEvol1,
    required this.urlSpeciesEvol1,
    required this.minLevelEvol1,
    required this.nameEvol2,
    required this.urlSpeciesEvol2,
    required this.minLevelEvol2,
    required this.nameEvol3,
    required this.urlSpeciesEvol3,
  });
  factory PokemonEvolutionModel.fromJson(Map<String, dynamic> json) { 
    var evolutionDetails = json['evolves_to'] as List<dynamic>;

    String? nameEvol1, urlSpeciesEvol1;
    String? nameEvol2, urlSpeciesEvol2;
    String? nameEvol3, urlSpeciesEvol3;
    int? minLevelEvol1, minLevelEvol2;

    // First evolution
    nameEvol1 = json['species']['name'];
    urlSpeciesEvol1 = json['species']['url'];
    
    if (evolutionDetails.isNotEmpty) {
      // Handle the first evolution
      var firstEvolution = evolutionDetails[0];
      minLevelEvol1 = firstEvolution['evolution_details'].isNotEmpty
          ? firstEvolution['evolution_details'][0]['min_level']
          : null;

      nameEvol2 = firstEvolution['species']['name'];
      urlSpeciesEvol2 = firstEvolution['species']['url'];

      // Check for the second evolution
      if (firstEvolution['evolves_to'].isNotEmpty) {
        var secondEvolution = firstEvolution['evolves_to'][0];
        minLevelEvol2 = secondEvolution['evolution_details'].isNotEmpty
            ? secondEvolution['evolution_details'][0]['min_level']
            : null;

        nameEvol3 = secondEvolution['species']['name'];
        urlSpeciesEvol3 = secondEvolution['species']['url'];
      }
    }
    return PokemonEvolutionModel(
      nameEvol1: nameEvol1,
      urlSpeciesEvol1: urlSpeciesEvol1,
      minLevelEvol1: minLevelEvol1,
      nameEvol2: nameEvol2,
      urlSpeciesEvol2: urlSpeciesEvol2,
      minLevelEvol2: minLevelEvol2,
      nameEvol3: nameEvol3,
      urlSpeciesEvol3: urlSpeciesEvol3,
    );
  }
}