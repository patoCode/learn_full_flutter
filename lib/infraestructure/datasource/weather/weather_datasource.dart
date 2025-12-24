import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:learn_full_flutter/config/config.dart';
import 'package:learn_full_flutter/infraestructure/datasource/weather/models/req/geo_request.dart';
import 'package:learn_full_flutter/infraestructure/datasource/weather/models/res/geo_response.dart';

class WeatherDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.uriApi,
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
    ),
  );

  Dio _buildDio(String uri) => Dio(
    BaseOptions(
      baseUrl: uri,
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
    ),
  );

  Future<GeoResponse> getCityData() async {
    final dio = _buildDio(Environment.geoUriApi);
    final request = GeoRequest(q: "bolivia", limit: "1");
    try {
      final response = await dio.get('', queryParameters: request.toJson());
      if (response.statusCode == 200) {
        return GeoResponse.fromJson(response.data);
      }
      log(response.data.toString());
    } on DioException catch (e) {
      throw Exception('Error de comunicación: ${e.type}');
    } catch (e) {
      log('Error inesperado: $e');
      rethrow;
    }

    return GeoResponse.error();
  }
}
