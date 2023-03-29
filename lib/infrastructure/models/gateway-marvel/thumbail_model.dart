class ThumbailModel {
  String path;
  String extensions;

  ThumbailModel({required this.path, required this.extensions});

  factory ThumbailModel.fromJson(Map<String, dynamic> json) => ThumbailModel(
        path: json['path'],
        extensions: json['extension'],
      );
}
