import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_point_model.freezed.dart';
part 'user_point_model.g.dart';

@freezed
class UserPointModel with _$UserPointModel {
  factory UserPointModel({
    required double? participationValue,
    required double? attitudeValue,
    required double? timeValue,
    required double? likeabilityValue,
    required double? trustworthinessValue,
  }) = _UserPointModel;

  factory UserPointModel.fromJson(Map<String, dynamic> json) =>
      _$UserPointModelFromJson(json);
}
