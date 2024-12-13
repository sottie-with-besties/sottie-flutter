import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:sottie_flutter/core/dio/server_ip.dart';

part 'post_repository.g.dart';

/// Authentication 관련 Rest Api 통신 코드
@RestApi(baseUrl: serverIp)
abstract class PostRepository {
  factory PostRepository(Dio dio, {String baseUrl}) = _PostRepository;

  @POST('/sottie/gatherings')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<HttpResponse> makePost({required Map<String, dynamic> postOptions});
}
