import 'package:get_it/get_it.dart';
import 'package:sottie_flutter/model/post/post_model.dart';
import 'package:sottie_flutter/repository/post/interface/post_repository.dart';
import 'package:sottie_flutter/ui/post/controller/post_options_setting.dart';

sealed class PostUseCase {
  static final _repo = GetIt.I.get<PostRepository>();

  /// 최신 모집글 불러오기
  static Future<List<PostModel>> getLatestPostEntityList({
    required int lastPostId,
  }) async {
    final postModelList = await _repo.getLatestPostModelList(
      lastPostId: lastPostId,
    );

    return postModelList;
  }

  /// 검색 모집글 불러오기
  static Future<List<PostModel>> getSearchPostEntityList({
    required Map<String, dynamic> searchSetting,
    required int lastPostId,
  }) async {
    final postModelList = await _repo.getSearchPostModelList(
      searchSetting: searchSetting,
      lastPostId: lastPostId,
    );

    return postModelList;
  }

  /// 포스트 만들기
  static Future<bool> makePost() async {
    try {
      final resp = await _repo.makePost(
        postSetting: postOptionsSetting.toJsonForMakePostSend(),
      );
      return true;
    } catch (_, stackTrace) {
      // Todo: resp status code에 따른 예외처리
      return false;
    }
  }

  /// 포스트 모집 참가
  static Future<bool> postJoin({
    required Map<String, dynamic> postJoinInfo,
  }) async {
    try {
      final resp = await _repo.postJoin(postJoinInfo: postJoinInfo);
      return true;
    } catch (e, stackTrace) {
      // Todo: resp status code에 따른 예외처리
      return false;
    }
  }

  /// 포스트 모집 나가기
  static Future<bool> postExit() async {
    try {
      final resp = await _repo.postExit();
      return true;
    } catch (e, stackTrace) {
      // Todo: resp status code에 따른 예외처리
      return false;
    }
  }
}

// FormData _formData;
//
// if (_selectedFiles.isEmpty) {//단일사진 전달
// final MultipartFile _file = MultipartFile.fromFileSync(
// imageFile!.path,
// contentType: MediaType("image", "jpg"));
// _formData = FormData.fromMap({"file": _file});
// } else {//다중사진 전달
// final List<MultipartFile> _files = _selectedFiles
//     .map((img) => MultipartFile.fromFileSync(img.path,
// contentType: MediaType("image", "jpg")))
//     .toList();
// _formData = FormData.fromMap({"file": _files});
// }
//
// Dio dio = Dio();
//
// dio.options.contentType = 'multipart/form-data';
// String currentLoginUserId =
// context.read<UserInfoProvider>().uid;
//
// final res = await dio.post(
// 'URL',
// data: _formData);
// if (res.statusCode == 200) {
//
// print(res.data);
// } else {
//
// print('eeerror');
// }
