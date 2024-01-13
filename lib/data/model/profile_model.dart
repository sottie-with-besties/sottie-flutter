import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class Profile {
  final int userId;
  final String? photo;
  final String? moodStatus;
  final String? introPhrase;

  Profile({
    required this.userId,
    required this.photo,
    required this.moodStatus,
    required this.introPhrase,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}