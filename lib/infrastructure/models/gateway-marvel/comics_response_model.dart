import 'package:super_heroes/infrastructure/models/gateway-marvel/thumbail_model.dart';

class ComicsResponseListModel {
  List<ComicsResponseModel> comics;

  ComicsResponseListModel({required this.comics});

  factory ComicsResponseListModel.fromList(List<dynamic> jsonList) =>
      ComicsResponseListModel(comics: jsonList.map((e) => ComicsResponseModel.fromJson(e)).toList());
}

class ComicsResponseModel {
  final int id;
  final String name;
  final String description;
  final ThumbailModel imageData;

  ComicsResponseModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageData,
  });

  factory ComicsResponseModel.fromJson(Map<String, dynamic> json) => ComicsResponseModel(
        id: json['id'],
        name: json['title'],
        description: (json['description'] == null || json['description'] == '') ? 'No description' : json['description'],
        imageData: ThumbailModel.fromJson(json['thumbnail']),
      );
}
