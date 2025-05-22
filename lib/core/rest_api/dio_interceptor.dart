import 'package:dio/dio.dart';
import 'package:sottie_flutter/core/local_database/token_storage.dart';

class _CustomInterceptor extends Interceptor {
  final _tokenStorage = TokenStorage();

  /// 디오가 네트워크 요청 할 때
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      'authorization': 'Bearer ${_tokenStorage.accessToken}',
    });
    super.onRequest(options, handler);
  }

  /// 네트워크 요청 에러
  /// 토큰이 만료 되었을 때 토큰 재요청
  /// 그 외의 에러는 에러 반환
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final refreshToken = await _tokenStorage.getRefreshToken();

    if (refreshToken == null) {
      return handler.reject(err);
    }

    final isStatus401 = err.response?.statusCode == 401;
    final isPathRefresh = err.requestOptions.path == '/auth/token';

    try {
      if (isStatus401 && !isPathRefresh) {
        // await _refreshAccessToken(refreshToken: refreshToken);

        final options = err.requestOptions;
        options.headers.addAll({
          'authorization': 'Bearer ${_tokenStorage.accessToken}',
        });

        final resp = await cleanDio.fetch(options);
        handler.resolve(resp);
      }
    } on Exception catch (_) {
      handler.reject(err);
    }
  }

  /// 액세스 토큰 만료되었을 때 호출
  // Future<void> _refreshAccessToken({required String refreshToken}) async {
  //   final newAccessTokenModel = await AuthRepository().(
  //     customDio,
  //   ).refreshAccessToken(refreshToken: 'Bearer $refreshToken');
  //
  //   _tokenStorage.changeAccessToken(
  //     newAcessToken: newAccessTokenModel.accessToken,
  //   );
  //
  //   await _tokenStorage.writeAccessToken(
  //     newAccessToken: newAccessTokenModel.accessToken,
  //   );
  // }
}

final customDio = Dio()..interceptors.add(_CustomInterceptor());
final cleanDio = Dio();
