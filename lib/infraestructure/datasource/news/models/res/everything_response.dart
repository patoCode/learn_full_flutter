import 'package:json_annotation/json_annotation.dart';

part 'everything_response.g.dart';

@JsonSerializable()
class EverythingResponse {
  String status;
  int totalResults;
  List<Article> articles;

  EverythingResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  Map<String, dynamic> toJson() => _$EverythingResponseToJson(this);
  factory EverythingResponse.fromJson(Map<String, dynamic> json) =>
      _$EverythingResponseFromJson(json);
}

@JsonSerializable()
class Article {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}

@JsonSerializable()
class Source {
  String? id;
  String name;

  Source({required this.id, required this.name});
  Map<String, dynamic> toJson() => _$SourceToJson(this);
  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}
