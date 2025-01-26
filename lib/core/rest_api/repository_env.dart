import 'package:get_it/get_it.dart';
import 'package:sottie_flutter/core/rest_api/dio_interceptor.dart';
import 'package:sottie_flutter/data/auth/repository_impl/auth_dev_repository_impl.dart';
import 'package:sottie_flutter/data/auth/repository_impl/auth_production_repository_impl.dart';
import 'package:sottie_flutter/data/friend/repository_impl/friend_dev_repository_impl.dart';
import 'package:sottie_flutter/data/friend/repository_impl/friend_production_repository_impl.dart';
import 'package:sottie_flutter/data/post/repository_impl/post_dev_repository_impl.dart';
import 'package:sottie_flutter/data/post/repository_impl/post_production_repository_impl.dart';
import 'package:sottie_flutter/domain/auth/repository_interface/auth_repository.dart';
import 'package:sottie_flutter/domain/friend/repository_interface/friend_repository.dart';
import 'package:sottie_flutter/domain/post/repository_interface/post_repository.dart';

const devServerIp = 'http://15.165.99.45:8080/';
const productionServerIp = '';

enum RepositoryEnvironment {
  dev,
  production,
}

void initRepositories(RepositoryEnvironment repoEnv) {
  switch (repoEnv) {
    case RepositoryEnvironment.dev:
      _initDevRepositories();
      break;
    case RepositoryEnvironment.production:
      _initProductionRepositories();
      break;
  }
}

/// 개발 서버 세팅
void _initDevRepositories() {
  GetIt.I
      .registerSingleton<AuthRepository>(AuthTokenDevRepositoryImpl(cleanDio));
  GetIt.I.registerSingleton<PostRepository>(PostDevRepositoryImpl(cleanDio));
  GetIt.I
      .registerSingleton<FriendRepository>(FriendDevRepositoryImpl(cleanDio));
}

/// 프로덕션 서버 세팅
void _initProductionRepositories() {
  GetIt.I.registerSingleton<AuthRepository>(
      AuthTokenProductionRepositoryImpl(cleanDio));
  GetIt.I.registerSingleton<PostRepository>(
      PostProductionRepositoryImpl(cleanDio));
  GetIt.I.registerSingleton<FriendRepository>(
      FriendProductionRepositoryImpl(cleanDio));
}
