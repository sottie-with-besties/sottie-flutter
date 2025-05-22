import 'package:http/http.dart';
import 'package:sottie_flutter/core/local_database/token_storage.dart';

class AuthClient extends BaseClient {
  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    /// 1. 액세스 토큰 설정
    request.headers['Authorization'] = 'Bearer ${TokenStorage().accessToken}';

    StreamedResponse response = await request.send();

    /// 2. 토큰 만료 시(401 Unauthorized), 리프레시 시도 후 재요청
    if (response.statusCode == 401 && request.url.path == '/auth/token') {
      final refreshToken = await TokenStorage().getRefreshToken();

      if (refreshToken == null) {
        return response;
      }

      await _refreshAccessToken(refreshToken: refreshToken);

      request.headers.addAll({
        'authorization': 'Bearer ${TokenStorage().accessToken}',
      });

      response = await request.send();
    }

    /// 3. 최종 리스폰스 반환
    return response;
  }
}

/// 액세스 토큰 만료되었을 때 호출
Future<void> _refreshAccessToken({required String refreshToken}) async {
  // final newAccessTokenModel = await AuthTokenDevRepositoryImpl(
  //   customDio,
  // ).refreshAccessToken(refreshToken: 'Bearer $refreshToken');
  //
  // TokenStorage.sgt().changeAccessToken(
  //   newAcessToken: newAccessTokenModel.accessToken,
  // );
  //
  // await TokenStorage.sgt().writeAccessToken(
  //   newAccessToken: newAccessTokenModel.accessToken,
  // );
}
