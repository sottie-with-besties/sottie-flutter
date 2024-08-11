import 'package:dio/dio.dart';
import 'package:sottie_flutter/core/local_database/secure_storage.dart';

class CustomInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    const accessToken = '';
    options.headers.addAll({'authorization': 'Bearer $accessToken'});
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final refreshToken = await tokenStorage.read(key: refreshTokenKey);

    if (refreshToken == null) {
      return handler.reject(err);
    }

    final isStatus401 = err.response?.statusCode == 401;
    final isPathRefresh = err.requestOptions.path == '/auth/token';

    try {
      if (isStatus401 && !isPathRefresh) {
        // Todo: 액세스 토큰 새로 발급 받는 restApi 코드

        final dio = Dio();
        final options = err.requestOptions;
        options.headers.addAll({'authorization': 'Bearer ${"accessToken"}'});

        final resp = await dio.fetch(options);
        handler.resolve(resp);
      }
    } on Exception catch (_) {
      handler.reject(err);
    }
  }
}
