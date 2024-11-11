import 'package:freezed_annotation/freezed_annotation.dart';

part 'dm_model.freezed.dart';
part 'dm_model.g.dart';

@freezed
class DmModelList with _$DmModelList {
  factory DmModelList({
    required List<DmModel> dmModelList,
  }) = _DmModelList;

  factory DmModelList.fromJson(Map<String, dynamic> json) =>
      _$DmModelListFromJson(json);
}

@freezed
class DmModel with _$DmModel {
  factory DmModel({
    required String id,

    /// DM을 주고받는 상대방의 닉네임
    required String nickName,

    /// 최근 받은 DM 내용
    required String latestMsg,

    /// 최근 받은 DM 시각
    required String latestTime,

    /// 읽지 않은 DM 수
    required int notReadMsg,
  }) = _DmModel;

  factory DmModel.fromJson(Map<String, dynamic> json) =>
      _$DmModelFromJson(json);
}
