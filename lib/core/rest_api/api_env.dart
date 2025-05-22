import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:sottie_flutter/core/rest_api/dio_interceptor.dart';
import 'package:sottie_flutter/core/rest_api/http_clients.dart';
import 'package:sottie_flutter/repository/friend/implements/friend_dev_repository_impl.dart';
import 'package:sottie_flutter/repository/friend/implements/friend_production_repository_impl.dart';
import 'package:sottie_flutter/repository/friend/interface/friend_repository.dart';
import 'package:sottie_flutter/repository/post/implements/post_dev_repository_impl.dart';
import 'package:sottie_flutter/repository/post/implements/post_production_repository_impl.dart';
import 'package:sottie_flutter/repository/post/interface/post_repository.dart';

const devServerIp = 'http://15.165.99.45:8080/';
const productionServerIp = '';

enum ServerEnvironment { dev, production }

final class ApiEnv {
  ApiEnv._();

  static final _instance = ApiEnv._();

  factory ApiEnv() => _instance;

  static const scheme = 'https';

  static const devHost = 'http://15.165.99.45:8080/';
  static const productionHost = '';

  static const devPort = 8080;
  static const productionPort = 8080;

  final serverEnvironment = ServerEnvironment.dev;

  final cleanClient = Client();
  final authClient = AuthClient();
}

void initRepositories(ServerEnvironment repoEnv) {
  switch (repoEnv) {
    case ServerEnvironment.dev:
      _initDevRepositories();
      break;
    case ServerEnvironment.production:
      _initProductionRepositories();
      break;
  }
}

/// 개발 서버 세팅
void _initDevRepositories() {
  GetIt.I.registerSingleton<PostRepository>(PostDevRepositoryImpl(cleanDio));
  GetIt.I.registerSingleton<FriendRepository>(
    FriendDevRepositoryImpl(cleanDio),
  );
}

/// 프로덕션 서버 세팅
void _initProductionRepositories() {
  GetIt.I.registerSingleton<PostRepository>(
    PostProductionRepositoryImpl(cleanDio),
  );
  GetIt.I.registerSingleton<FriendRepository>(
    FriendProductionRepositoryImpl(cleanDio),
  );
}
