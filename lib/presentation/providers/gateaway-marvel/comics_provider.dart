import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_heroes/domain/entitites/comics_entity.dart';
import 'package:super_heroes/presentation/providers/providers.dart';

final getComicsProvider = StateNotifierProvider<ComicsNotifier, List<ComicsEntity>>((ref) {
  final fetchComics = ref.watch(gateawayMarvelRepositoryProvider).getComics;

  return ComicsNotifier(fetchComics: fetchComics);
});

typedef ComicsCallback = Future<List<ComicsEntity>> Function({required int characterID});

class ComicsNotifier extends StateNotifier<List<ComicsEntity>> {
  ComicsCallback fetchComics;
  bool isLoading = false;
  ComicsNotifier({required this.fetchComics}) : super([]);

  Future<void> loadComics({required int characterID}) async {
    state.clear();
    final List<ComicsEntity> comics = await fetchComics(characterID: characterID);
    state = comics;
  }
}
