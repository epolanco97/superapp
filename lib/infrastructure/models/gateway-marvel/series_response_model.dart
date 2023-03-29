import 'package:super_heroes/infrastructure/models/gateway-marvel/thumbail_model.dart';

class SeriesResponseListModel {
  List<SeriesResponseModel> series;

  SeriesResponseListModel({required this.series});

  factory SeriesResponseListModel.fromList(List<dynamic> jsonList) =>
      SeriesResponseListModel(series: jsonList.map((e) => SeriesResponseModel.fromJson(e)).toList());
}

class SeriesResponseModel {
  final int id;
  final String name;
  final ThumbailModel imageData;

  SeriesResponseModel({
    required this.id,
    required this.name,
    required this.imageData,
  });

  factory SeriesResponseModel.fromJson(Map<String, dynamic> json) => SeriesResponseModel(
        id: json['id'],
        name: json['title'],
        imageData: ThumbailModel.fromJson(json['thumbnail']),
      );
}
