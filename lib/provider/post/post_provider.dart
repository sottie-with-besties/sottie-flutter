import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:sottie_flutter/domain/post/entity/post_options_entity.dart';
import 'package:sottie_flutter/domain/post/use_case/post_use_case.dart';

final _useCase = GetIt.I.get<PostUseCase>();

final class PostProvider {
  Future<bool> makePost() async {
    try {
      final resp = await _useCase.makePost(
        postSetting: postOptions.toJsonForMakePostSend(),
      );

      // Todo: resp status code에 따른 예외처리
      return true;
    } catch (_, __) {
      return false;
    }
  }

  Future<bool> postJoin({required int postId, int userId = 7}) async {
    try {
      final resp = await _useCase.postJoin(
        postJoinInfo: {'gatheringId': 18, 'userId': 7},
      );
      log("성공");
      return true;
    } catch (e, stackTrace) {
      log(e.toString());
      log(stackTrace.toString());
      return false;
    }
  }

  Future<bool> postExit() async {
    try {
      final resp = await _useCase.postExit();
      return true;
    } catch (e, stackTrace) {
      log(e.toString());
      log(stackTrace.toString());
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
