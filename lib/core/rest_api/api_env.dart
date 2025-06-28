import 'package:http/http.dart';
import 'package:sottie_flutter/core/rest_api/http_clients.dart';

enum ServerEnvironment { dummy, dev, production }

final class ApiEnv {
  ApiEnv._();

  static final _instance = ApiEnv._();

  factory ApiEnv() => _instance;

  static const scheme = 'https';

  static const devHost = '15.165.99.45';
  static const productionHost = '';

  static const devPort = 8080;
  static const productionPort = 8080;

  static const serverEnvironment = ServerEnvironment.dummy;

  final cleanClient = Client();
  final authClient = AuthClient();
}
