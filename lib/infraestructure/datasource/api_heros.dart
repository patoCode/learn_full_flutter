import 'dart:io';

import 'package:dio/dio.dart';
import 'package:learn_full_flutter/config/config.dart';

import 'models/models.dart';

class ApiHeros {
  final dio = Dio(
    BaseOptions(
      baseUrl: Constants.baseUrl,
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    ),
  );

  Future<bool> getHerosPage({int sizePage = 10, int offset = 0}) async {
    try {
      return true;
    } catch (e) {
      return false;
    }
  }
}
