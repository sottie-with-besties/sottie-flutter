import 'dart:math';

import 'package:sottie_flutter/data/friend/model/friend_detail_model.dart';

Future<FriendDetailModel> getFriendDetailDummy() async {
  await Future.delayed(const Duration(seconds: 1), null);
  return FriendDetailModel(
    id: 'id',
    nickname: 'nickname',
    stateMsg: 'stateMsg',
    participationValue: _randomPoint(),
    attitudeValue: _randomPoint(),
    timeValue: _randomPoint(),
    likeabilityValue: _randomPoint(),
    trustworthinessValue: _randomPoint(),
    friendReviews: [
      FriendReviewModel(
        id: '1',
        nickname: 'Alice',
        total: 75,
        participationIndex: 3,
        attitudeIndex: 4,
        timeIndex: 2,
        likeabilityIndex: 4,
        trustworthinessIndex: 3,
      ),
      FriendReviewModel(
        id: '2',
        nickname: 'Bob',
        total: 50,
        participationIndex: 2,
        attitudeIndex: 3,
        timeIndex: 3,
        likeabilityIndex: 2,
        trustworthinessIndex: 2,
      ),
      FriendReviewModel(
        id: '3',
        nickname: 'Charlie',
        total: 85,
        participationIndex: 4,
        attitudeIndex: 4,
        timeIndex: 4,
        likeabilityIndex: 3,
        trustworthinessIndex: 4,
      ),
      FriendReviewModel(
        id: '4',
        nickname: 'David',
        total: 40,
        participationIndex: 1,
        attitudeIndex: 2,
        timeIndex: 1,
        likeabilityIndex: 3,
        trustworthinessIndex: 2,
      ),
      FriendReviewModel(
        id: '5',
        nickname: 'Eva',
        total: 95,
        participationIndex: 4,
        attitudeIndex: 4,
        timeIndex: 4,
        likeabilityIndex: 4,
        trustworthinessIndex: 4,
      ),
      FriendReviewModel(
        id: '6',
        nickname: 'Frank',
        total: 30,
        participationIndex: 1,
        attitudeIndex: 1,
        timeIndex: 1,
        likeabilityIndex: 2,
        trustworthinessIndex: 1,
      ),
      FriendReviewModel(
        id: '7',
        nickname: 'Grace',
        total: 65,
        participationIndex: 3,
        attitudeIndex: 3,
        timeIndex: 2,
        likeabilityIndex: 3,
        trustworthinessIndex: 3,
      ),
      FriendReviewModel(
        id: '8',
        nickname: 'Hank',
        total: 55,
        participationIndex: 2,
        attitudeIndex: 3,
        timeIndex: 3,
        likeabilityIndex: 2,
        trustworthinessIndex: 3,
      ),
      FriendReviewModel(
        id: '9',
        nickname: 'Ivy',
        total: 90,
        participationIndex: 4,
        attitudeIndex: 4,
        timeIndex: 4,
        likeabilityIndex: 3,
        trustworthinessIndex: 4,
      ),
      FriendReviewModel(
        id: '10',
        nickname: 'Jack',
        total: 70,
        participationIndex: 3,
        attitudeIndex: 3,
        timeIndex: 3,
        likeabilityIndex: 3,
        trustworthinessIndex: 3,
      ),
    ],
  );
}

double _randomPoint() {
  // 0~20.0 사이의 랜덤한 실수를 소수점 첫째자리까지 생성
  return double.parse((Random().nextDouble() * 20.0).toStringAsFixed(1));
}
