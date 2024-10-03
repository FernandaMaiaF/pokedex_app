// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonDetailController on _PokemonDetailController, Store {
  late final _$pokemonDetailAtom =
      Atom(name: '_PokemonDetailController.pokemonDetail', context: context);

  @override
  PokemonInfoModel? get pokemonDetail {
    _$pokemonDetailAtom.reportRead();
    return super.pokemonDetail;
  }

  @override
  set pokemonDetail(PokemonInfoModel? value) {
    _$pokemonDetailAtom.reportWrite(value, super.pokemonDetail, () {
      super.pokemonDetail = value;
    });
  }

  late final _$typeDetailsAtom =
      Atom(name: '_PokemonDetailController.typeDetails', context: context);

  @override
  ObservableList<PokemonTypeInfoModel> get typeDetails {
    _$typeDetailsAtom.reportRead();
    return super.typeDetails;
  }

  @override
  set typeDetails(ObservableList<PokemonTypeInfoModel> value) {
    _$typeDetailsAtom.reportWrite(value, super.typeDetails, () {
      super.typeDetails = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_PokemonDetailController.isLoading', context: context);

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

  late final _$errorMessageAtom =
      Atom(name: '_PokemonDetailController.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$loadPokemonDetailAsyncAction = AsyncAction(
      '_PokemonDetailController.loadPokemonDetail',
      context: context);

  @override
  Future<void> loadPokemonDetail(String pokemonId) {
    return _$loadPokemonDetailAsyncAction
        .run(() => super.loadPokemonDetail(pokemonId));
  }

  @override
  String toString() {
    return '''
pokemonDetail: ${pokemonDetail},
typeDetails: ${typeDetails},
isLoading: ${isLoading},
errorMessage: ${errorMessage}
    ''';
  }
}
