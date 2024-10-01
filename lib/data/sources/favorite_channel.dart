import 'package:flutter/services.dart';

class FavoriteChannel {
  static const MethodChannel _channel = MethodChannel('com.myapp/favorites');

  static Future<void> saveFavorite(String pokemonId) async {
    try {
      await _channel.invokeMethod('saveFavorite', {'id': pokemonId});
    } catch (e) {
      print('Failed to save favorite: $e');
    }
  }


  static Future<void> removeFavorite(String pokemonId) async {
    try {
      await _channel.invokeMethod('removeFavorite', {'id': pokemonId});
    } catch (e) {
      print('Failed to save favorite: $e');
    }
  }

  static Future<List<String>> getFavorites() async {
    try {
      final List<dynamic> favorites = await _channel.invokeMethod('getFavorites');
      return favorites.cast<String>();
    } catch (e) {
      print('Failed to get favorites: $e');
      return [];
    }
  }
}
