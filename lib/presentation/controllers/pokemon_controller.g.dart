// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonController on _PokemonControllerBase, Store {
  late final _$pokemonsAtom =
      Atom(name: '_PokemonControllerBase.pokemons', context: context);

  @override
  ObservableList<PokemonModel> get pokemons {
    _$pokemonsAtom.reportRead();
    return super.pokemons;
  }

  @override
  set pokemons(ObservableList<PokemonModel> value) {
    _$pokemonsAtom.reportWrite(value, super.pokemons, () {
      super.pokemons = value;
    });
  }

  late final _$pokemonDetailsAtom =
      Atom(name: '_PokemonControllerBase.pokemonDetails', context: context);

  @override
  ObservableMap<String, PokemonSummaryModel> get pokemonDetails {
    _$pokemonDetailsAtom.reportRead();
    return super.pokemonDetails;
  }

  @override
  set pokemonDetails(ObservableMap<String, PokemonSummaryModel> value) {
    _$pokemonDetailsAtom.reportWrite(value, super.pokemonDetails, () {
      super.pokemonDetails = value;
    });
  }

  late final _$filteredPokemonsAtom =
      Atom(name: '_PokemonControllerBase.filteredPokemons', context: context);

  @override
  ObservableList<PokemonModel> get filteredPokemons {
    _$filteredPokemonsAtom.reportRead();
    return super.filteredPokemons;
  }

  @override
  set filteredPokemons(ObservableList<PokemonModel> value) {
    _$filteredPokemonsAtom.reportWrite(value, super.filteredPokemons, () {
      super.filteredPokemons = value;
    });
  }

  late final _$pokemonInfoAtom =
      Atom(name: '_PokemonControllerBase.pokemonInfo', context: context);

  @override
  ObservableMap<String, PokemonInfoModel> get pokemonInfo {
    _$pokemonInfoAtom.reportRead();
    return super.pokemonInfo;
  }

  @override
  set pokemonInfo(ObservableMap<String, PokemonInfoModel> value) {
    _$pokemonInfoAtom.reportWrite(value, super.pokemonInfo, () {
      super.pokemonInfo = value;
    });
  }

  late final _$pokemonInfoTypeAtom =
      Atom(name: '_PokemonControllerBase.pokemonInfoType', context: context);

  @override
  ObservableMap<String, PokemonTypeInfoModel> get pokemonInfoType {
    _$pokemonInfoTypeAtom.reportRead();
    return super.pokemonInfoType;
  }

  @override
  set pokemonInfoType(ObservableMap<String, PokemonTypeInfoModel> value) {
    _$pokemonInfoTypeAtom.reportWrite(value, super.pokemonInfoType, () {
      super.pokemonInfoType = value;
    });
  }

  late final _$onlyFavoritesAtom =
      Atom(name: '_PokemonControllerBase.onlyFavorites', context: context);

  @override
  bool get onlyFavorites {
    _$onlyFavoritesAtom.reportRead();
    return super.onlyFavorites;
  }

  @override
  set onlyFavorites(bool value) {
    _$onlyFavoritesAtom.reportWrite(value, super.onlyFavorites, () {
      super.onlyFavorites = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_PokemonControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isLoadingDetailsAtom =
      Atom(name: '_PokemonControllerBase.isLoadingDetails', context: context);

  @override
  bool get isLoadingDetails {
    _$isLoadingDetailsAtom.reportRead();
    return super.isLoadingDetails;
  }

  @override
  set isLoadingDetails(bool value) {
    _$isLoadingDetailsAtom.reportWrite(value, super.isLoadingDetails, () {
      super.isLoadingDetails = value;
    });
  }

  late final _$isLoadingInfoAtom =
      Atom(name: '_PokemonControllerBase.isLoadingInfo', context: context);

  @override
  bool get isLoadingInfo {
    _$isLoadingInfoAtom.reportRead();
    return super.isLoadingInfo;
  }

  @override
  set isLoadingInfo(bool value) {
    _$isLoadingInfoAtom.reportWrite(value, super.isLoadingInfo, () {
      super.isLoadingInfo = value;
    });
  }

  late final _$getPokemonsAsyncAction =
      AsyncAction('_PokemonControllerBase.getPokemons', context: context);

  @override
  Future<void> getPokemons() {
    return _$getPokemonsAsyncAction.run(() => super.getPokemons());
  }

  late final _$getPokemonSummaryAsyncAction =
      AsyncAction('_PokemonControllerBase.getPokemonSummary', context: context);

  @override
  Future<void> getPokemonSummary(String url) {
    return _$getPokemonSummaryAsyncAction
        .run(() => super.getPokemonSummary(url));
  }

  late final _$getPokemonInfoAsyncAction =
      AsyncAction('_PokemonControllerBase.getPokemonInfo', context: context);

  @override
  Future<void> getPokemonInfo(String url) {
    return _$getPokemonInfoAsyncAction.run(() => super.getPokemonInfo(url));
  }

  late final _$getPokemonTypeInfoAsyncAction = AsyncAction(
      '_PokemonControllerBase.getPokemonTypeInfo',
      context: context);

  @override
  Future<void> getPokemonTypeInfo(String url) {
    return _$getPokemonTypeInfoAsyncAction
        .run(() => super.getPokemonTypeInfo(url));
  }

  late final _$_PokemonControllerBaseActionController =
      ActionController(name: '_PokemonControllerBase', context: context);

  @override
  void filterPokemons(String query) {
    final _$actionInfo = _$_PokemonControllerBaseActionController.startAction(
        name: '_PokemonControllerBase.filterPokemons');
    try {
      return super.filterPokemons(query);
    } finally {
      _$_PokemonControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleFavorites() {
    final _$actionInfo = _$_PokemonControllerBaseActionController.startAction(
        name: '_PokemonControllerBase.toggleFavorites');
    try {
      return super.toggleFavorites();
    } finally {
      _$_PokemonControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemons: ${pokemons},
pokemonDetails: ${pokemonDetails},
filteredPokemons: ${filteredPokemons},
pokemonInfo: ${pokemonInfo},
pokemonInfoType: ${pokemonInfoType},
onlyFavorites: ${onlyFavorites},
isLoading: ${isLoading},
isLoadingDetails: ${isLoadingDetails},
isLoadingInfo: ${isLoadingInfo}
    ''';
  }
}
