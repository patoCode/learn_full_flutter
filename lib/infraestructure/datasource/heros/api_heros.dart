import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:learn_full_flutter/config/config.dart';

import 'models/models.dart';

class ApiHeros {
  final dio = Dio(
    BaseOptions(
      baseUrl: Constants.baseUrl,
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    ),
  );

  Future<List<IdResponse>> getHerosPage({required int page}) async {
    try {
      final int startId = (page * 10) + 1;
      final List<int> idsToFetch = List.generate(1, (index) => startId + index);

      final List<IdResponse> heroesPage = [];

      // 2. Procesamos secuencialmente para evitar el "Connection Reset"
      for (final id in idsToFetch) {
        log("SOLICITANDO ID: $id");

        final response = await dio.get('$id');

        if (response.statusCode == 200) {
          // Mapeamos y agregamos a nuestra lista temporal
          heroesPage.add(IdResponse.fromJson(response.data!));
        } else {
          log("Hero $id no encontrado (Status: ${response.statusCode})");
        }

        // 3. Pequeño delay de cortesía para el servidor
        await Future.delayed(const Duration(milliseconds: 150));
      }

      return heroesPage;
    } on DioException catch (e) {
      // Si el error es por saturación, lo verás aquí
      log('Dio Error en página $page: ${e.message}');
      throw Exception('Error de comunicación: ${e.type}');
    } catch (e) {
      log('Error inesperado: $e');
      rethrow;
    }
  }
}
