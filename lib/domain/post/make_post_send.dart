import 'package:dio/dio.dart';
import 'package:sottie_flutter/domain/post/post_setting_entity.dart';

Future<void> makePostSend() async {
  // Todo: @MultiPart()로 보낼 수 있는지 확인
  final formData = FormData.fromMap(postSettingEntity.toJsonForMakePostSend());
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
