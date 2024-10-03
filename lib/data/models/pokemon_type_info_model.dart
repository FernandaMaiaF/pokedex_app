class PokemonTypeInfoModel {
  final List<String> doubleDemageFrom;
  final List<String> doubleDemageTo;
  final List<String> halfDemageFrom;
  final List<String> halfDemageTo;
  final List<String> noDemageFrom;
  final List<String> noDemageTo;

  PokemonTypeInfoModel({
    required this.doubleDemageTo,
    required this.halfDemageFrom,
    required this.halfDemageTo,
    required this.noDemageFrom,
    required this.noDemageTo, 
    required this.doubleDemageFrom,
  });

  factory PokemonTypeInfoModel.fromJson(Map<String, dynamic> json) {
    List<String> doubleDemageFromTmp = [];
    List<String> doubleDemageToTmp = [];
    List<String> halfDemageFromTmp = [];
    List<String> halfDemageToTmp = [];
    List<String> noDemageFromTmp = [];
    List<String> noDemageToTmp = [];

    json['double_damage_from'].forEach((value) {
      doubleDemageFromTmp.add(value['name']);
    });
    json['double_damage_to'].forEach((value) {
      doubleDemageToTmp.add(value['name']);
    });
    json['half_damage_from'].forEach((value) {
      halfDemageFromTmp.add(value['name']);
    });
    json['half_damage_to'].forEach((value) {
      halfDemageToTmp.add(value['name']);
    });
    json['no_damage_from'].forEach((value) {
      noDemageFromTmp.add(value['name']);
    });
    json['no_damage_to'].forEach((value) {
      noDemageToTmp.add(value['name']);
    });

    return PokemonTypeInfoModel(
      doubleDemageFrom: doubleDemageFromTmp,
      doubleDemageTo: doubleDemageToTmp,
      halfDemageFrom: halfDemageFromTmp,
      halfDemageTo: halfDemageToTmp,
      noDemageFrom: noDemageFromTmp,
      noDemageTo: noDemageToTmp,
    );
  }
}
