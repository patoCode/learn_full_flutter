import 'package:json_annotation/json_annotation.dart';
import 'package:learn_full_flutter/config/constants/environment.dart';

part 'geo_request.g.dart';

@JsonSerializable()
class GeoRequest {
  String q;
  String appId;
  String limit;

  GeoRequest({required this.q, required this.limit})
    : appId = Environment.apikey;

  Map<String, dynamic> toJson() => _$GeoRequestToJson(this);
  factory GeoRequest.fromJson(Map<String, dynamic> json) =>
      _$GeoRequestFromJson(json);
}
