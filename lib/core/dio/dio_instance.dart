import 'package:dio/dio.dart';
import 'package:sottie_flutter/core/dio/dio_interceptor.dart';

final dioWithInterceptor = Dio()..interceptors.add(CustomInterceptor());
final dioWithNoInterceptor = Dio();