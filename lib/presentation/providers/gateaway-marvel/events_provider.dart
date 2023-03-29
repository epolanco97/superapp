import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_heroes/domain/entitites/entities.dart';
import 'package:super_heroes/presentation/providers/gateaway-marvel/gateaway_marvel_repository_provider.dart';

final getEventsProvider = StateNotifierProvider<EventsNotifier, List<EventsEntity>>((ref) {
  final fetchEvents = ref.watch(gateawayMarvelRepositoryProvider).getEvents;

  return EventsNotifier(fetchEvents: fetchEvents);
});

typedef EventsCallBack = Future<List<EventsEntity>> Function({required int characterID});

class EventsNotifier extends StateNotifier<List<EventsEntity>> {
  EventsCallBack fetchEvents;
  EventsNotifier({required this.fetchEvents}) : super([]);

  Future<void> loadEvents({required int characterID}) async {
    state.clear();
    final List<EventsEntity> events = await fetchEvents(characterID: characterID);
    state = events;
  }
}
