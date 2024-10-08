import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_app/data/models/pokemon_summary_model.dart';
import 'package:pokedex_app/data/models/pokemon_type_model.dart';

import 'package:pokedex_app/data/repositories/pokemon_repository.dart';
import 'package:pokedex_app/domain/usecases/get_pokemon_summary_usecase.dart';
import 'get_pokemon_summary_usecase_test.mocks.dart';

@GenerateMocks([PokemonRepository])
void main() {
  late GetPokemonSummaryUseCase useCase;
  late MockPokemonRepository mockPokemonRepository;

  setUp(() {
    mockPokemonRepository = MockPokemonRepository();
    useCase = GetPokemonSummaryUseCase(mockPokemonRepository);
  });

  test('Deve pegar algumas informações do pokemon pela url', () async {
    when(mockPokemonRepository
            .getPokemonSummary('https://pokeapi.co/api/v2/pokemon/1/'))
        .thenAnswer(
      (_) async => PokemonSummaryModel(
          id: 1,
          type: [
            PokemonTypeModel(
                name: 'grass', url: 'https://pokeapi.co/api/v2/type/12/'),
            PokemonTypeModel(
                name: 'poison', url: 'https://pokeapi.co/api/v2/type/4/')
          ],
          urlspecies: 'https://pokeapi.co/api/v2/pokemon-species/1/'),
    );

    final result = await useCase.call('https://pokeapi.co/api/v2/pokemon/1/');

    expect(result, isA<PokemonSummaryModel>());
    expect(result.id, 1);
  });
}
