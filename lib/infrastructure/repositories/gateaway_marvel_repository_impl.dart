import 'package:super_heroes/domain/datasources/gateway_marvel_datasource.dart';
import 'package:super_heroes/domain/entitites/entities.dart';
import 'package:super_heroes/domain/repositories/gateaway_marvel_repository.dart';

class GateawayMarvelRepositoryImpl implements GateawayMarvelRepository {
  final GateawayMarvelDatasource datasource;

  GateawayMarvelRepositoryImpl(this.datasource);

  @override
  Future<List<CharacterEntity>> getCharacters() {
    return datasource.getCharacters();
  }

  @override
  Future<List<ComicsEntity>> getComics({required int characterID}) {
    return datasource.getComics(characterID: characterID);
  }

  @override
  Future<List<EventsEntity>> getEvents({required int characterID}) {
    return datasource.getEvents(characterID: characterID);
  }

  @override
  Future<List<SeriesEntity>> getSeries({required int characterID}) {
    return datasource.getSeries(characterID: characterID);
  }

  @override
  Future<List<StoriesEntity>> getStories({required int characterID}) {
    return datasource.getStories(characterID: characterID);
  }
}
