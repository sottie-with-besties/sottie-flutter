import 'dart:developer';

import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:sottie_flutter/core/dio/server_ip.dart';
import 'package:sottie_flutter/data/post/model/post_model.dart';

part 'home_post_retrofit.g.dart';

/// Authentication 관련 Rest Api 통신 코드
@RestApi(baseUrl: serverIp)
abstract class HomePostRetrofit {
  factory HomePostRetrofit(Dio dio, {String baseUrl}) = _HomePostRetrofit;

  @GET('/sottie/gatherings')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<List<PostModel>> getLatestPostModelList({required int lastPostId});

  @GET('/sottie/home/search')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<List<PostModel>> getSearchPostModelList({
    required Map<String, dynamic> searchSetting,
    required int lastPostId,
  });
}
