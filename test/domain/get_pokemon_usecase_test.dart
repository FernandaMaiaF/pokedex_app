import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:pokedex_app/data/models/pokemon_model.dart';
import 'package:pokedex_app/data/repositories/pokemon_repository.dart';
import 'package:pokedex_app/domain/usecases/get_pokemons_usecase.dart';

import 'get_pokemon_usecase_test.mocks.dart';


@GenerateMocks([PokemonRepository])

void main() {
  late GetPokemonsUsecase useCase;
  late MockPokemonRepository mockPokemonRepository;

  setUp(() {
    mockPokemonRepository = MockPokemonRepository();
    useCase = GetPokemonsUsecase(mockPokemonRepository);
  });
  
  test('Deve pegar a lista de pokemons do repositório', () async {
    when(mockPokemonRepository.getPokemons(20, 0))
        .thenAnswer((_) async => [PokemonModel(name: 'Pikachu', url: 'https://pokeapi.co/api/v2/pokemon-form/25/')]);

    final result = await useCase.call(20, 0);

    expect(result, isA<List<PokemonModel>>());
    expect(result.first.name, 'Pikachu');
  });
}
