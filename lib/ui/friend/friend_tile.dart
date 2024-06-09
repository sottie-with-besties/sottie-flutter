import 'package:flutter/material.dart';


class FriendTile extends StatelessWidget {
  const FriendTile(
      {super.key,
        required this.userId,
        required this.nickName,
        this.moodStatus,
        this.introPhrase,
        required this.imgUrl
      });

  final int? userId; // 친구 User Id
  final String nickName; // 친구 이름
  final String? moodStatus; // 친구 감정상태 이모티콘
  final String? introPhrase; // 친구 상태 메세지
  final String imgUrl; // 친구 이미지 url

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(nickName),
      subtitle: introPhrase != null ? Text(introPhrase!) : null, //상태 메세지가 있을 경우 출력
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(11),
        child: Image.network(imgUrl),
      ),
    );
  }
}