import 'package:super_heroes/infrastructure/models/gateway-marvel/thumbail_model.dart';

class CharacterResponseListModel {
  List<CharactersResponseModel> characters;

  CharacterResponseListModel({required this.characters});

  factory CharacterResponseListModel.fromList(List<dynamic> jsonList) =>
      CharacterResponseListModel(characters: jsonList.map((e) => CharactersResponseModel.fromJson(e)).toList());
}

class CharactersResponseModel {
  final int id;
  final String name;
  final ThumbailModel imageData;

  CharactersResponseModel({
    required this.id,
    required this.name,
    required this.imageData,
  });

  factory CharactersResponseModel.fromJson(Map<String, dynamic> json) => CharactersResponseModel(
        id: json['id'],
        name: json['name'],
        imageData: ThumbailModel.fromJson(json['thumbnail']),
      );
}
