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

    /// 해당 DM을 터치한 후 들어갔을 때의 DM 채팅방 id(필요한지 모르겠음)
    required String name,

    /// DM을 주고받는 상대방의 이름(실명? 닉네임?)
    required String latestMsg,

    /// 최근 받은 DM 내용
    required String latestTime,

    /// 최근 받은 DM 시각
    required String inDmId,

    /// 읽지 않은 DM 수
    required int notReadMsg,
  }) = _DmModel;

  factory DmModel.fromJson(Map<String, dynamic> json) =>
      _$DmModelFromJson(json);
}
