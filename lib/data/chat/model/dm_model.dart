import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sottie_flutter/data/user/model/user_model.dart';

part 'dm_model.freezed.dart';
part 'dm_model.g.dart';

@freezed
class DmModel with _$DmModel {
  factory DmModel({
    required int id,

    /// DM을 주고받는 상대방의 정보
    required UserModel userModel,

    /// 최근 받은 DM 내용
    required String latestMsg,

    /// 최근 받은 DM 시각
    required DateTime latestTime,

    /// 읽지 않은 DM 수
    required int notReadMsg,
  }) = _DmModel;

  factory DmModel.fromJson(Map<String, dynamic> json) =>
      _$DmModelFromJson(json);
}
