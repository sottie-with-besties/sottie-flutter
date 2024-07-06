import 'package:freezed_annotation/freezed_annotation.dart';

part 'find_model.freezed.dart';
part 'find_model.g.dart';

@freezed
class FindModel with _$FindModel {
  factory FindModel({
    required String id,
  }) = _FindModel;

  factory FindModel.fromJson(Map<String, dynamic> json) =>
      _$FindModelFromJson(json);
}
