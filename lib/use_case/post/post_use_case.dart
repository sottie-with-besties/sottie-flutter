import 'package:sottie_flutter/model/post/post_model.dart';
import 'package:sottie_flutter/repository/post/interface/post_repository.dart';
import 'package:sottie_flutter/ui/post/controller/post_options_setting.dart';

sealed class PostUseCase {
  static final _repo = PostRepository();

  // 최신 모집글 불러오기
  static Future<List<PostModel>> getLatestPostModelList({
    required int lastPostId,
  }) async {
    final postModelList = await _repo.getLatestPostModelList(
      lastPostId: lastPostId,
    );

    return postModelList;
  }

  // 검색 모집글 불러오기
  static Future<List<PostModel>> getSearchPostModelList({
    required Map<String, dynamic> searchSetting,
    required int lastPostId,
  }) async {
    final postModelList = await _repo.getSearchPostModelList(
      searchSetting: searchSetting,
      lastPostId: lastPostId,
    );

    return postModelList;
  }

  // 포스트 만들기
  static Future<bool> makePost() async {
    try {
      await _repo.makePost(
        postSetting: postOptionsSetting.toJsonForMakePostSend(),
      );
      return true;
    } catch (_) {
      // Todo: resp status code에 따른 예외처리
      return false;
    }
  }

  // 포스트 모집 참가
  static Future<bool> postJoin({required String roomId}) async {
    try {
      await _repo.postJoin(roomId: roomId);
      return true;
    } catch (e) {
      // Todo: resp status code에 따른 예외처리
      return false;
    }
  }

  // 포스트 모집 나가기
  static Future<bool> postExit({required String roomId}) async {
    try {
      await _repo.postExit(roomId: roomId);
      return true;
    } catch (e) {
      // Todo: resp status code에 따른 예외처리
      return false;
    }
  }
}
