
import 'dart:developer';

import 'package:dio/dio.dart';
class DioApi {
  // flutter run --dart-define=BASE_URL="API_URL"
  static const baseUrl = String.fromEnvironment("BASE_URL") ?? 'http://localhost:8080';
  static BaseOptions options = BaseOptions(
    //로컬호스트
    baseUrl: baseUrl,
    headers: {
      'Content-Type': 'application/json',
    },
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
  );

  static final dio = Dio(options);

  static Future call<T>({
    required String path,
    String method = 'GET',
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response<T> response = await dio.request<T>(path
                                                , options: Options(method: method)
                                                , queryParameters: queryParameters
                                                , data: data);

      if (response.statusCode != 200) {
        throw Exception('Failed to load data');
      }

      return response.data;
    } on Exception catch (e) {
      log('Exception: $e');
      return null;
    }
  }
}

