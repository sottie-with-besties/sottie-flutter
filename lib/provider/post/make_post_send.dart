import 'dart:developer';

import 'package:sottie_flutter/core/dio/dio_interceptor.dart';
import 'package:sottie_flutter/data/post/repository_impl/post_repository_impl.dart';
import 'package:sottie_flutter/provider/post/post_setting_entity.dart';

final _repo = PostRepositoryImpl(cleanDio);

Future<bool> makePostSend() async {
  try {
    final resp = await _repo.makePost(
        postSetting: postSettingEntity.toJsonForMakePostSend());

    // Todo: resp status code에 따른 예외처리
    return true;
  } catch (e, stackTrace) {
    log(e.toString());
    log(stackTrace.toString());

    return false;
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
