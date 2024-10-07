import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_app/data/repositories/pokemon_repository.dart';
import 'package:pokedex_app/data/repositories/pokemon_repository_impl.dart';
import 'package:pokedex_app/data/sources/remote/pokemon_detail_evolution_service.dart';
import 'package:pokedex_app/data/sources/remote/pokemon_detail_service.dart';
import 'package:pokedex_app/data/sources/remote/pokemon_detail_type_service.dart';
import 'package:pokedex_app/data/sources/remote/pokemon_service.dart';
import 'package:pokedex_app/domain/usecases/get_pokemon_evolution_usecase.dart';
import 'package:pokedex_app/domain/usecases/get_pokemon_info_usecase.dart';
import 'package:pokedex_app/domain/usecases/get_pokemon_summary_usecase.dart';
import 'package:pokedex_app/domain/usecases/get_pokemon_type_info_usecase.dart';
import 'package:pokedex_app/domain/usecases/get_pokemons_usecase.dart';
import 'package:pokedex_app/presentation/controllers/favorites_store_controller.dart';
import 'package:pokedex_app/presentation/controllers/pokemon_controller.dart';
import 'package:pokedex_app/presentation/controllers/pokemon_detail_controller.dart';
import 'package:pokedex_app/presentation/controllers/pokemon_evolution_controller.dart';
import 'package:pokedex_app/presentation/views/pokemon_detail_view.dart';
import 'package:pokedex_app/presentation/views/pokemon_view.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => http.Client());

  // Data Sources
    getIt.registerLazySingleton<PokemonService>(() => PokemonService(client: getIt()));
    getIt.registerLazySingleton<PokemonDetailService>(() => PokemonDetailService(client: getIt()));
    getIt.registerLazySingleton<PokemonDetailTypeService>(() => PokemonDetailTypeService(client: getIt()));
    getIt.registerLazySingleton<PokemonDetailEvolutionService>(() => PokemonDetailEvolutionService(client: getIt()));

  // Repositório
  getIt.registerLazySingleton<PokemonRepository>(
      () => PokemonRepositoryImpl(getIt<http.Client>(), getIt<PokemonService>(),getIt<PokemonDetailService>(), getIt<PokemonDetailService>(), getIt<PokemonDetailTypeService>(), getIt<PokemonDetailEvolutionService>()));

  // Caso de Uso
  getIt.registerFactory(() => GetPokemonsUsecase(getIt<PokemonRepository>()));
  getIt.registerFactory(
      () => GetPokemonSummaryUseCase(getIt<PokemonRepository>()));
  getIt
      .registerFactory(() => GetPokemonInfoUseCase(getIt<PokemonRepository>()));
  getIt.registerFactory(
      () => GetPokemonTypeInfoUseCase(getIt<PokemonRepository>()));
getIt.registerFactory(
      () => GetPokemonEvolutionUseCase(getIt<PokemonRepository>()));

  // Controller
  getIt.registerFactory(() => PokemonController(
      getIt<GetPokemonsUsecase>(),
      getIt<GetPokemonSummaryUseCase>(),
      getIt<GetPokemonInfoUseCase>(),
      getIt<GetPokemonTypeInfoUseCase>()));
  getIt.registerFactory<PokemonDetailController>(
      () => PokemonDetailController(getIt<PokemonRepository>()));
  getIt.registerLazySingleton<FavoritesStore>(() => FavoritesStore());
  getIt.registerLazySingleton<PokemonEvolutionController>(() => PokemonEvolutionController(getIt<GetPokemonEvolutionUseCase>()));

  
}

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFFFF0000),
        scaffoldBackgroundColor: const Color(0xFFE8E8E8),
        appBarTheme: const AppBarTheme(
          toolbarHeight: 70,
          backgroundColor: Color(0xFFE3350D),
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      home: PokemonView(),
      routes: {
        PokemonDetailView.routName: (context) => PokemonDetailView(),
      },
    );
  }
}
