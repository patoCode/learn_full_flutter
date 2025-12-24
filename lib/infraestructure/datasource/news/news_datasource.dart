import 'dart:io';

import 'package:dio/dio.dart';
import 'package:learn_full_flutter/config/constants/constants.dart';
import 'package:learn_full_flutter/infraestructure/datasource/news/models/req/app_query.dart';
import 'package:learn_full_flutter/infraestructure/datasource/news/models/res/everything_response.dart';

class NewsDatasource {
  final dio = Dio();

  Dio _buildDio(String uri) => Dio(
    BaseOptions(
      baseUrl: uri,
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    ),
  );

  String buildUriAction(String path1, String path2) => "";

  Future<EverythingResponse> searchByQuery(
    String query, {
    int page = 1,
    int pageSize = 10,
  }) async {
    final dataIn = AppQuery(
      language: 'es',
      q: query.trim(),
      searchIn: "title",
      page: page,
      pageSize: pageSize,
    );

    final dio = _buildDio(NewsApiSettings.everything);
    final response = await dio.get('', queryParameters: dataIn.toJson());
    final res = EverythingResponse.fromJson(response.data);
    return res;
  }
}
