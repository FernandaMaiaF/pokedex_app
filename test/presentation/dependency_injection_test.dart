


import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_app/data/repositories/pokemon_repository.dart';
import 'package:pokedex_app/data/repositories/pokemon_repository_impl.dart';
import 'package:pokedex_app/domain/usecases/get_pokemons_usecase.dart';
import 'package:pokedex_app/main.dart';
import 'package:pokedex_app/presentation/controllers/pokemon_controller.dart';

void main() {
  setUp(() {
    // Chama a configuração de injeção
    setup();
  });

  tearDown(() {
    // Reseta o getIt após cada teste para evitar dependências residuais
    getIt.reset();
  });

  test('Deve registrar e injetar http.Client', () {
    // Verifica se http.Client foi registrado e recuperado corretamente
    final client = getIt<http.Client>();
    expect(client, isA<http.Client>());
  });

  test('Deve registrar e injetar PokemonRepository', () {
    // Verifica se PokemonRepository foi registrado e recuperado corretamente
    final repository = getIt<PokemonRepository>();
    expect(repository, isA<PokemonRepositoryImpl>());
  });

  test('Deve registrar e injetar GetPokemonsUsecase', () {
    // Verifica se GetPokemonsUsecase foi registrado e recuperado corretamente
    final usecase = getIt<GetPokemonsUsecase>();
    expect(usecase, isA<GetPokemonsUsecase>());
  });

  test('Deve registrar e injetar PokemonController', () {
    // Verifica se PokemonController foi registrado e recuperado corretamente
    final controller = getIt<PokemonController>();
    expect(controller, isA<PokemonController>());
  });
}