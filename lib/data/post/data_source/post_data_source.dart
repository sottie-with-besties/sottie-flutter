import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:sottie_flutter/core/dio/server_ip.dart';
import 'package:sottie_flutter/data/post/model/post_model.dart';

part 'post_data_source.g.dart';

/// Authentication 관련 Rest Api 통신 코드
@RestApi(baseUrl: serverIp)
abstract class PostDataSource {
  factory PostDataSource(Dio dio, {String baseUrl}) = _PostDataSource;

  /// 최신 포스트 불러오기
  @GET('/sottie/gatherings')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<List<PostModel>> getLatestPostModelList({required int lastPostId});

  /// 검색 포스트 불러오기
  @GET('/sottie/home/search')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<List<PostModel>> getSearchPostModelList({
    required Map<String, dynamic> searchSetting,
    required int lastPostId,
  });

  /// 포스트 만들기
  @POST('/sottie/gathering')
  @Headers(<String, dynamic>{'Content-Type': "application/json"})
  Future<HttpResponse> makePost(
      {@Body() required Map<String, dynamic> postSetting});

  /// 포스트 모집 참가
  @POST('/sottie/gathering/join')
  @Headers(<String, dynamic>{'Content-Type': "application/json"})
  Future<HttpResponse> postJoin(
      {@Body() required Map<String, dynamic> postJoinInfo});

  /// 포스트 모집 나가기
  @POST('/sottie/gathering/exit')
  @Headers(<String, dynamic>{'Content-Type': "application/json"})
  Future<HttpResponse> postExit();
}
