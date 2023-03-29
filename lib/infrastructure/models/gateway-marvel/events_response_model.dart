import 'package:super_heroes/infrastructure/models/gateway-marvel/thumbail_model.dart';

class EventsResponseListModel {
  List<EventsResponseModel> events;

  EventsResponseListModel({required this.events});

  factory EventsResponseListModel.fromList(List<dynamic> jsonList) =>
      EventsResponseListModel(events: jsonList.map((e) => EventsResponseModel.fromJson(e)).toList());
}

class EventsResponseModel {
  final int id;
  final String name;
  final String description;
  final ThumbailModel imageData;

  EventsResponseModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageData,
  });

  factory EventsResponseModel.fromJson(Map<String, dynamic> json) => EventsResponseModel(
        id: json['id'],
        name: json['title'],
        description: (json['description'] == null || json['description'] == '') ? 'No description' : json['description'],
        imageData: ThumbailModel.fromJson(json['thumbnail']),
      );
}
