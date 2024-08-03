import 'package:dio/dio.dart';
import 'package:sottie_flutter/domain/post/post_setting_entity.dart';

Future<void> makePostSend() async {
  List? images;
  if (postSettingEntity.images != null) {
    images = postSettingEntity.images!.map((img) {
      return MultipartFile.fromFileSync(img.path,
          contentType: DioMediaType('image', 'jpg'));
    }).toList();
  }

  // Todo: @MultiPart()로 보낼 수 있는지 확인
  final formData = FormData.fromMap({
    'id': postSettingEntity.id,
    'title': postSettingEntity.title,
    'content': postSettingEntity.content,
    'images': images ?? [],
    'category': postSettingEntity.convertCategoryToStringList(), // Enum 데이터
    'date':
        postSettingEntity.date != null ? postSettingEntity.date!.toUtc() : '',
    'location': postSettingEntity.location.toString(), // Enum 데이터
    'numOfMember': postSettingEntity.numOfMember,
    'gender': postSettingEntity.gender.name, // Enum 데이터
    'genderRatio': postSettingEntity.genderRatio,
    'numOfMan': postSettingEntity.numOfMan,
    'numOfWoman': postSettingEntity.numOfWoman,
    'ageRange': postSettingEntity.convertAgeRangeToStringList(), // Enum 데이터
    'manner': postSettingEntity.manner,
    'startSameTime': postSettingEntity.startSameTime,
    'openParticipation': postSettingEntity.openParticipation,
    'onlyMyFriends': postSettingEntity.onlyMyFriends,
  });
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
