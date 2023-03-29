import 'package:super_heroes/domain/entitites/character_entity.dart';
import 'package:super_heroes/domain/entitites/comics_entity.dart';
import 'package:super_heroes/domain/entitites/events_entity.dart';
import 'package:super_heroes/domain/entitites/series_entity.dart';
import 'package:super_heroes/domain/entitites/stories_entity.dart';

abstract class GateawayMarvelRepository {
  Future<List<CharacterEntity>> getCharacters();

  Future<List<ComicsEntity>> getComics({required int characterID});

  Future<List<EventsEntity>> getEvents({required int characterID});

  Future<List<SeriesEntity>> getSeries({required int characterID});

  Future<List<StoriesEntity>> getStories({required int characterID});
}
