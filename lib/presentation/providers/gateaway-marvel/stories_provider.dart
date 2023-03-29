import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_heroes/domain/entitites/entities.dart';
import 'package:super_heroes/presentation/providers/gateaway-marvel/gateaway_marvel_repository_provider.dart';

final getStoriesProvider = StateNotifierProvider<StoriesNotifier, List<StoriesEntity>>((ref) {
  final fetchStories = ref.watch(gateawayMarvelRepositoryProvider).getStories;

  return StoriesNotifier(fetchStories: fetchStories);
});

typedef StoriesCallBack = Future<List<StoriesEntity>> Function({required int characterID});

class StoriesNotifier extends StateNotifier<List<StoriesEntity>> {
  StoriesCallBack fetchStories;
  StoriesNotifier({required this.fetchStories}) : super([]);

  Future<void> loadStories({required int characterID}) async {
    state.clear();
    final List<StoriesEntity> stories = await fetchStories(characterID: characterID);
    state = stories;
  }
}
