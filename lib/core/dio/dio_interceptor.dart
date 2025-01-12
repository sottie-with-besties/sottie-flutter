import 'package:dio/dio.dart';
import 'package:sottie_flutter/core/local_database/secure_storage.dart';
import 'package:sottie_flutter/data/auth/repository_impl/auth_repository_impl.dart';
import 'package:sottie_flutter/domain/auth/entity/access_token_entity.dart';

class _CustomInterceptor extends Interceptor {
  /// 디오가 네트워크 요청 할 때
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers
        .addAll({'authorization': 'Bearer ${accessTokenEntity.accessToken}'});
    super.onRequest(options, handler);
  }

  /// 네트워크 요청 에러
  /// 토큰이 만료 되었을 때 토큰 재요청
  /// 그 외의 에러는 에러 반환
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
        await _refreshAccessToken(refreshToken: refreshToken);

        final dio = Dio();
        final options = err.requestOptions;
        options.headers.addAll(
            {'authorization': 'Bearer ${accessTokenEntity.accessToken}'});

        final resp = await dio.fetch(options);
        handler.resolve(resp);
      }
    } on Exception catch (_) {
      handler.reject(err);
    }
  }
}

/// 액세스 토큰 만료되었을 때 호출
Future<void> _refreshAccessToken({required String refreshToken}) async {
  final newAccessTokenModel = await AuthTokenRepositoryImpl(customDio)
      .refreshAccessToken(refreshToken: 'Bearer $refreshToken');

  accessTokenEntity.changeToken(newAccessTokenModel.accessToken);

  await tokenStorage.write(
      key: accessTokenKey, value: newAccessTokenModel.accessToken);
}

final customDio = Dio()..interceptors.add(_CustomInterceptor());
final cleanDio = Dio();
