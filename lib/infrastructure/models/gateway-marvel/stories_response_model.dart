class StoriesResponseListModel {
  List<StoriesResponseModel> stories;

  StoriesResponseListModel({required this.stories});

  factory StoriesResponseListModel.fromList(List<dynamic> jsonList) =>
      StoriesResponseListModel(stories: jsonList.map((e) => StoriesResponseModel.fromJson(e)).toList());
}

class StoriesResponseModel {
  final int id;
  final String name;

  StoriesResponseModel({
    required this.id,
    required this.name,
  });

  factory StoriesResponseModel.fromJson(Map<String, dynamic> json) => StoriesResponseModel(
        id: json['id'],
        name: json['title'],
      );
}
