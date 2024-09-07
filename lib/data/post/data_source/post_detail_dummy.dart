import 'package:sottie_flutter/data/post/model/post_detail_model.dart';

Future<PostDetailModel> getPostDetailDummy() async {
  await Future.delayed(const Duration(seconds: 1), null);
  return PostDetailModel(
    id: '1',
    thumbnailUrls: null,
    content: 'Sottie 포스트 디테일 스크린입니다. 유저가 모집에 관한 구체적 내용을 적습니다.',
    ageRange: ['10대', '30대', '50대', '20대'],
    mannerPoint: 36.5,
    startSameTime: true,
    openParticipation: false,
    onlyMyFriends: false,
  );
}
