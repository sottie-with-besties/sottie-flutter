import 'package:freezed_annotation/freezed_annotation.dart';

part 'dm_model.freezed.dart';
part 'dm_model.g.dart';

@freezed
class DmModel with _$DmModel {
  factory DmModel({
    required String id,
    required String inDmId,
    required String name,
    required String latestMsg,
    required String latestTime,
    required int notReadMsg,
  }) = _DmModel;

  factory DmModel.fromJson(Map<String, dynamic> json) =>
      _$DmModelFromJson(json);
}
