import 'package:super_heroes/domain/entitites/entities.dart';
import 'package:super_heroes/infrastructure/models/gateway-marvel/characters_reponse_model.dart';
import 'package:super_heroes/infrastructure/models/gateway-marvel/comics_response_model.dart';
import 'package:super_heroes/infrastructure/models/gateway-marvel/events_response_model.dart';
import 'package:super_heroes/infrastructure/models/gateway-marvel/series_response_model.dart';
import 'package:super_heroes/infrastructure/models/gateway-marvel/stories_response_model.dart';

class GateawayMarvelMapper {
  static CharacterEntity characterToEntity(CharactersResponseModel character) => CharacterEntity(
        id: character.id,
        name: character.name,
        imagePath: '${character.imageData.path}.${character.imageData.extensions}',
      );

  static ComicsEntity comicsToEntity(ComicsResponseModel comics) => ComicsEntity(
        id: comics.id,
        name: comics.name,
        imagePath: '${comics.imageData.path}.${comics.imageData.extensions}',
        description: comics.description,
      );

  static EventsEntity eventsToEntity(EventsResponseModel events) => EventsEntity(
        id: events.id,
        name: events.name,
        imagePath: '${events.imageData.path}.${events.imageData.extensions}',
        description: events.description,
      );

  static SeriesEntity seriesToEntity(SeriesResponseModel series) => SeriesEntity(
        id: series.id,
        name: series.name,
        imagePath: '${series.imageData.path}.${series.imageData.extensions}',
      );

  static StoriesEntity storiesToEntity(StoriesResponseModel stories) => StoriesEntity(
        id: stories.id,
        name: stories.name,
      );
}
