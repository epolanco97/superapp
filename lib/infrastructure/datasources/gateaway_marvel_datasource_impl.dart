import 'package:super_heroes/config/api/call_api.dart';
import 'package:super_heroes/domain/datasources/gateway_marvel_datasource.dart';
import 'package:super_heroes/domain/entitites/entities.dart';
import 'package:super_heroes/infrastructure/mappers/mappers.dart';
import 'package:super_heroes/infrastructure/models/gateway-marvel/models.dart';
import 'package:super_heroes/infrastructure/models/gateway-marvel/stories_response_model.dart';

class GateawayMarvelDatasourceImpl implements GateawayMarvelDatasource {
  @override
  Future<List<CharacterEntity>> getCharacters() async {
    final resp = await CallApi.dio.get('/characters');

    final respToModel = CharacterResponseListModel.fromList(resp.data['data']['results']);

    final List<CharacterEntity> characters = respToModel.characters.map((character) => GateawayMarvelMapper.characterToEntity(character)).toList();

    return characters;
  }

  @override
  Future<List<ComicsEntity>> getComics({required int characterID}) async {
    final resp = await CallApi.dio.get('/characters/$characterID/comics');

    final respToModel = ComicsResponseListModel.fromList(resp.data['data']['results']);

    final List<ComicsEntity> comics = respToModel.comics.map((comic) => GateawayMarvelMapper.comicsToEntity(comic)).toList();

    return comics;
  }

  @override
  Future<List<EventsEntity>> getEvents({required int characterID}) async {
    final resp = await CallApi.dio.get('/characters/$characterID/events');

    final respToModel = EventsResponseListModel.fromList(resp.data['data']['results']);

    final List<EventsEntity> events = respToModel.events.map((event) => GateawayMarvelMapper.eventsToEntity(event)).toList();

    return events;
  }

  @override
  Future<List<SeriesEntity>> getSeries({required int characterID}) async {
    final resp = await CallApi.dio.get('/characters/$characterID/series');

    final respToModel = SeriesResponseListModel.fromList(resp.data['data']['results']);

    final List<SeriesEntity> series = respToModel.series.map((serie) => GateawayMarvelMapper.seriesToEntity(serie)).toList();

    return series;
  }

  @override
  Future<List<StoriesEntity>> getStories({required int characterID}) async {
    final resp = await CallApi.dio.get('/characters/$characterID/stories');

    final respToModel = StoriesResponseListModel.fromList(resp.data['data']['results']);

    final List<StoriesEntity> stories = respToModel.stories.map((story) => GateawayMarvelMapper.storiesToEntity(story)).toList();

    return stories;
  }
}
