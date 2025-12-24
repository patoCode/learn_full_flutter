// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoRequest _$GeoRequestFromJson(Map<String, dynamic> json) => GeoRequest(
      q: json['q'] as String,
      limit: json['limit'] as String,
    )..appId = json['appId'] as String;

Map<String, dynamic> _$GeoRequestToJson(GeoRequest instance) =>
    <String, dynamic>{
      'q': instance.q,
      'appId': instance.appId,
      'limit': instance.limit,
    };
