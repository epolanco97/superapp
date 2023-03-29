import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_heroes/domain/entitites/entities.dart';
import 'package:super_heroes/presentation/providers/gateaway-marvel/gateaway_marvel_repository_provider.dart';

final getSeriesProvider = StateNotifierProvider<SeriesNotifier, List<SeriesEntity>>((ref) {
  final fetchSeries = ref.watch(gateawayMarvelRepositoryProvider).getSeries;

  return SeriesNotifier(fetchSeries: fetchSeries);
});

typedef SeriesCallBack = Future<List<SeriesEntity>> Function({required int characterID});

class SeriesNotifier extends StateNotifier<List<SeriesEntity>> {
  SeriesCallBack fetchSeries;
  SeriesNotifier({required this.fetchSeries}) : super([]);

  Future<void> loadSeries({required int characterID}) async {
    state.clear();
    final List<SeriesEntity> series = await fetchSeries(characterID: characterID);
    state = series;
  }
}
