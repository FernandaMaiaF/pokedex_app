package com.example.pokedex_app

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
  private val favorites = mutableListOf<String>()

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
      super.configureFlutterEngine(flutterEngine)
      MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "com.myapp/favorites")
        .setMethodCallHandler { call, result ->
          when (call.method) {
            "saveFavorite" -> {
              val id = call.argument<String>("id")
              id?.let { favorites.add(it) }
              result.success(null)
            }
            "getFavorites" -> {
              result.success(favorites)
            }
            "removeFavorite" -> {
              val id = call.argument<String>("id")
              id?.let { favorites.remove(it) }
              result.success(null)
            }
            else -> result.notImplemented()
          }
        }
    }
}
