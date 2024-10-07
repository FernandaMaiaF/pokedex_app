import 'package:mobx/mobx.dart';
import 'package:pokedex_app/data/sources/local/favorite_channel.dart';

part 'favorites_store_controller.g.dart';

class FavoritesStore = _FavoritesStore with _$FavoritesStore;

abstract class _FavoritesStore with Store {
  @observable
  ObservableList<String> favorites = ObservableList<String>(); 

  @action
  Future<void> loadFavorites() async {
    final loadedFavorites = await FavoriteChannel.getFavorites();
    favorites.addAll(loadedFavorites);
  }

  @action
  Future<void> addFavorite(String pokemonId) async {
    if (!favorites.contains(pokemonId)) {
      favorites.add(pokemonId);
      await FavoriteChannel.saveFavorite(pokemonId);
    }
    print('favorites: ${favorites.first}');
  }

  @action
  Future<void> removeFavorite(String pokemonId) async {
    favorites.remove(pokemonId);
    await FavoriteChannel.removeFavorite(pokemonId);
  }

  @action
  Future<bool> isFavorite(String pokemonId) async {
    return favorites.contains(pokemonId);
  }
}
