import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_app/data/models/pokemon_base_status_model.dart';
import 'package:pokedex_app/data/models/pokemon_info_model.dart';
import 'package:pokedex_app/data/models/pokemon_type_model.dart';

import 'package:pokedex_app/data/repositories/pokemon_repository.dart';
import 'package:pokedex_app/domain/usecases/get_pokemon_info_usecase.dart';
import 'get_pokemon_info_usecase_test.mocks.dart';

@GenerateMocks([PokemonRepository])
void main() {
  late GetPokemonInfoUseCase useCase;
  late MockPokemonRepository mockPokemonRepository;

  setUp(() {
    mockPokemonRepository = MockPokemonRepository();
    useCase = GetPokemonInfoUseCase(mockPokemonRepository);
  });

  test('Deve pegard diversas informações do pokemon pela url', () async {
    when(mockPokemonRepository
            .getPokemonInfo('https://pokeapi.co/api/v2/pokemon/1/'))
        .thenAnswer(
      (_) async => PokemonInfoModel(
          id: 1,
          baseExperience: 64,
          weight: 69,
          height: 7,
          baseStatus: [
            PokemonBaseStatusModel(name: 'hp', effort: 0, status: 45),
            PokemonBaseStatusModel(name: 'attack', effort: 0, status: 49),
            PokemonBaseStatusModel(name: 'defense', effort: 0, status: 49),
            PokemonBaseStatusModel(name: 'special-attack', effort: 1, status: 65),
            PokemonBaseStatusModel(name: 'special-defense', effort: 0, status: 65),
            PokemonBaseStatusModel(name: 'speed', effort: 0, status: 45),
          ],
          type: [
            PokemonTypeModel(
                name: 'grass', url: 'https://pokeapi.co/api/v2/type/12/'),
            PokemonTypeModel(
                name: 'poison', url: 'https://pokeapi.co/api/v2/type/4/')
          ],
    ),);

    final result = await useCase.call('https://pokeapi.co/api/v2/pokemon/1/');

    expect(result, isA<PokemonInfoModel>());
    expect(result.id, 1);
    expect(result.weight, 69);
  });
}
