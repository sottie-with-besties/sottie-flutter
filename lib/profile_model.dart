
import 'dart:ffi';

class Profile {
  final Long userId;
  final String? photo;
  final String? moodStatus;
  final String? introPhrase;

  Profile({
    required this.userId,
    required this.photo,
    required this.moodStatus,
    required this.introPhrase,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
        userId: json['userId'],
        photo: json['photo'],
        moodStatus: json['moodStatus'],
        introPhrase: json['introPhrase']
    );
  }
  Map<String, dynamic> toJson() => {
    'userId': userId,
    'photo': photo,
    'moodStatus': moodStatus,
    'introPhrase': introPhrase,
  };
}