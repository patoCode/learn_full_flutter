import 'package:json_annotation/json_annotation.dart';
import 'package:learn_full_flutter/config/config.dart';

part 'app_query.g.dart';

@JsonSerializable()
class AppQuery {
  final String language;
  final String searchIn;
  final String q;
  String apiKey;
  int pageSize;
  int page;

  AppQuery({
    required this.language,
    required this.searchIn,
    required this.q,
    this.pageSize = 10,
    this.page = 1,
  }) : apiKey = NewsApiSettings.apiKey;

  Map<String, dynamic> toJson() => _$AppQueryToJson(this);
  factory AppQuery.fromJson(Map<String, dynamic> json) =>
      _$AppQueryFromJson(json);
}
