import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:pokedex_app/data/models/pokemon_type_info_model.dart';
import 'package:pokedex_app/data/repositories/pokemon_repository.dart';
import 'package:pokedex_app/domain/usecases/get_pokemon_type_info_usecase.dart';
import 'get_pokemon_type_info_usecase_test.mocks.dart';


@GenerateMocks([PokemonRepository])

void main() {
  late GetPokemonTypeInfoUseCase useCase;
  late MockPokemonRepository mockPokemonRepository;

  setUp(() {
    mockPokemonRepository = MockPokemonRepository();
    useCase = GetPokemonTypeInfoUseCase(mockPokemonRepository);
  });
  
  test('Deve pegar as informações do tipo grass pela url', () async {
    when(mockPokemonRepository.getPokemonTypeInfo('https://pokeapi.co/api/v2/type/12/'))
        .thenAnswer((_) async => 
          PokemonTypeInfoModel(
            doubleDemageFrom: ['flying', 'poison', 'bug', 'fire', 'ice'],
            doubleDemageTo: ['ground', 'rock', 'water'],
            halfDemageFrom: ['ground', 'water', 'grass', 'electric'],
            halfDemageTo: ['fire', 'grass', 'poison', 'flying', 'bug', 'dragon', 'steel'],
            noDemageFrom: [],
            noDemageTo: [],
          ));

    final result = await useCase.call('https://pokeapi.co/api/v2/type/12/');

    expect(result, isA<PokemonTypeInfoModel>());
    expect(result.doubleDemageFrom.first, 'flying');
  });
}
