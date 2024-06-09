import 'package:json_annotation/json_annotation.dart';

part 'friend_model.g.dart';

@JsonSerializable()
class Friend {
  final int? userId;
  final String? alias;
  final String? photo;
  final String? moodStatus;
  final String? introPhrase;

  Friend(this.photo, this.moodStatus, this.introPhrase, {required this.userId, required this.alias});

  @override
  String toString() {
    return 'Friend{userId: $userId, alias: $alias, photo: $photo, moodStatus: $moodStatus, introPhrase: $introPhrase}';
  }

  factory Friend.fromJson(Map<String, dynamic> json) => _$FriendFromJson(json);
  Map<String, dynamic> toJson() => _$FriendToJson(this);
}