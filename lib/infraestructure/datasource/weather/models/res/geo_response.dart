import 'package:json_annotation/json_annotation.dart';

part 'geo_response.g.dart';

@JsonSerializable()
class GeoResponse {
  String name;
  double lat;
  double lon;
  String country;
  String state;
  LocalNames? localNames;

  GeoResponse({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
    required this.state,
    this.localNames,
  });

  GeoResponse.error() : name = '', lat = 0, lon = 0, country = '', state = '';

  Map<String, dynamic> toJson() => _$GeoResponseToJson(this);
  factory GeoResponse.fromJson(List<String> json) =>
      _$GeoResponseFromJson(json);
}

@JsonSerializable()
class LocalNames {
  String hi;

  LocalNames({required this.hi});

  Map<String, dynamic> toJson() => _$LocalNamesToJson(this);
  factory LocalNames.fromJson(Map<String, dynamic> json) =>
      _$LocalNamesFromJson(json);
}
