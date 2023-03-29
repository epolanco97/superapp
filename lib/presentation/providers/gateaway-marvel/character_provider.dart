import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_heroes/domain/entitites/character_entity.dart';
import 'package:super_heroes/presentation/providers/providers.dart';

final getCharactersProvider = StateNotifierProvider<CharactersNotifier, List<CharacterEntity>>((ref) {
  final fetchCharacters = ref.watch(gateawayMarvelRepositoryProvider).getCharacters;

  return CharactersNotifier(fetchCharacters: fetchCharacters);
});

typedef CharactersCallback = Future<List<CharacterEntity>> Function();

class CharactersNotifier extends StateNotifier<List<CharacterEntity>> {
  
  CharactersCallback fetchCharacters;
  CharactersNotifier({required this.fetchCharacters}) : super([]);

  Future<void> loadCharacters() async {
    final List<CharacterEntity> characters = await fetchCharacters();
    state = characters;
  }
}
