// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_store_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoritesStore on _FavoritesStore, Store {
  late final _$favoritesAtom =
      Atom(name: '_FavoritesStore.favorites', context: context);

  @override
  ObservableList<String> get favorites {
    _$favoritesAtom.reportRead();
    return super.favorites;
  }

  @override
  set favorites(ObservableList<String> value) {
    _$favoritesAtom.reportWrite(value, super.favorites, () {
      super.favorites = value;
    });
  }

  late final _$loadFavoritesAsyncAction =
      AsyncAction('_FavoritesStore.loadFavorites', context: context);

  @override
  Future<void> loadFavorites() {
    return _$loadFavoritesAsyncAction.run(() => super.loadFavorites());
  }

  late final _$addFavoriteAsyncAction =
      AsyncAction('_FavoritesStore.addFavorite', context: context);

  @override
  Future<void> addFavorite(String pokemonId) {
    return _$addFavoriteAsyncAction.run(() => super.addFavorite(pokemonId));
  }

  late final _$removeFavoriteAsyncAction =
      AsyncAction('_FavoritesStore.removeFavorite', context: context);

  @override
  Future<void> removeFavorite(String pokemonId) {
    return _$removeFavoriteAsyncAction
        .run(() => super.removeFavorite(pokemonId));
  }

  late final _$isFavoriteAsyncAction =
      AsyncAction('_FavoritesStore.isFavorite', context: context);

  @override
  Future<bool> isFavorite(String pokemonId) {
    return _$isFavoriteAsyncAction.run(() => super.isFavorite(pokemonId));
  }

  @override
  String toString() {
    return '''
favorites: ${favorites}
    ''';
  }
}
