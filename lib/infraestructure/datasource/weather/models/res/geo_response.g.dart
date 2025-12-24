// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoResponse _$GeoResponseFromJson(Map<String, dynamic> json) => GeoResponse(
      name: json['name'] as String,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      country: json['country'] as String,
      state: json['state'] as String,
      localNames: json['localNames'] == null
          ? null
          : LocalNames.fromJson(json['localNames'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeoResponseToJson(GeoResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'lat': instance.lat,
      'lon': instance.lon,
      'country': instance.country,
      'state': instance.state,
      'localNames': instance.localNames,
    };

LocalNames _$LocalNamesFromJson(Map<String, dynamic> json) => LocalNames(
      hi: json['hi'] as String,
    );

Map<String, dynamic> _$LocalNamesToJson(LocalNames instance) =>
    <String, dynamic>{
      'hi': instance.hi,
    };
