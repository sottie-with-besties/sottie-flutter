import 'package:dio/dio.dart';
import 'package:sottie_flutter/domain/post/make_post_detail_entity.dart';

Future<void> makePostSend() async {
  List? images;
  if (makePostDetailEntity.images != null) {
    images = makePostDetailEntity.images!.map((img) {
      return MultipartFile.fromFileSync(img.path,
          contentType: DioMediaType('image', 'jpg'));
    }).toList();
  }

  // @Body로 보낼 수 있는지 확인
  final formData = FormData.fromMap({
    'id': makePostDetailEntity.id,
    'title': makePostDetailEntity.title,
    'content': makePostDetailEntity.content,
    'images': images ?? [],
    // 'category': makePostDetailEntity.category, => Enum 데이터
    'date': makePostDetailEntity.date != null
        ? makePostDetailEntity.date!.toUtc()
        : '',
    'location': makePostDetailEntity.location.toString(), // Enum 데이터
    'numOfMember': makePostDetailEntity.numOfMember,
    'gender': makePostDetailEntity.gender.name, // Enum 데이터
    'genderRatio': makePostDetailEntity.genderRatio,
    'numOfMan': makePostDetailEntity.numOfMan,
    'numOfWoman': makePostDetailEntity.numOfWoman,
    // 'ageRange': makePostDetailEntity.ageRange, // Enum 데이터
    'manner': makePostDetailEntity.manner,
    'startSameTime': makePostDetailEntity.startSameTime,
    'openParticipation': makePostDetailEntity.openParticipation,
    'onlyMyFriends': makePostDetailEntity.onlyMyFriends,
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
