// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppQuery _$AppQueryFromJson(Map<String, dynamic> json) => AppQuery(
      language: json['language'] as String,
      searchIn: json['searchIn'] as String,
      q: json['q'] as String,
      pageSize: (json['pageSize'] as num?)?.toInt() ?? 10,
      page: (json['page'] as num?)?.toInt() ?? 1,
    )..apiKey = json['apiKey'] as String;

Map<String, dynamic> _$AppQueryToJson(AppQuery instance) => <String, dynamic>{
      'language': instance.language,
      'searchIn': instance.searchIn,
      'q': instance.q,
      'apiKey': instance.apiKey,
      'pageSize': instance.pageSize,
      'page': instance.page,
    };
