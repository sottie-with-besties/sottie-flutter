import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/widget/user_profile.dart';

class FriendDmBox extends StatelessWidget {
  const FriendDmBox({
    super.key,
    this.avatarId,
  });

  final String? avatarId;

  @override
  Widget build(BuildContext context) {
    const opponentStyle = TextStyle(color: Colors.black);
    const myStyle = TextStyle(color: mainSilverColor);

    return InputDecorator(
      decoration: InputDecoration(
        labelText: 'DM',
        labelStyle: const TextStyle(
          color: mainSilverColor,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: mainSilverColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: SizedBox(
        height: 350 * hu,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              renderDmChatBox(
                [
                  const Text(
                    "안녕하세요.",
                    style: opponentStyle,
                  ),
                ],
                false,
                avatarId,
              ),
              renderDmChatBox(
                [
                  const Text(
                    "반갑습니다.",
                    style: myStyle,
                  ),
                ],
                true,
                avatarId,
              ),
              renderDmChatBox(
                [
                  const Text(
                    "어디서 만날까요?",
                    style: opponentStyle,
                  ),
                ],
                false,
                avatarId,
              ),
              renderDmChatBox(
                [
                  const Text(
                    "수원에서 뵈요.",
                    style: myStyle,
                  ),
                ],
                true,
                avatarId,
              ),
              renderDmChatBox(
                [
                  const Text(
                    "넵.",
                    style: opponentStyle,
                  ),
                ],
                false,
                avatarId,
              ),
              renderDmChatBox(
                [
                  const Text(
                    "넵.",
                    style: opponentStyle,
                  ),
                ],
                false,
                avatarId,
              ),
              renderDmChatBox(
                [
                  const Text(
                    "넵.",
                    style: opponentStyle,
                  ),
                ],
                false,
                avatarId,
              ),
              renderDmChatBox(
                [
                  const Text(
                    "넵.",
                    style: opponentStyle,
                  ),
                ],
                false,
                avatarId,
              ),
              renderDmChatBox(
                [
                  const Text(
                    "ㅁㄴ아ㅣ;러마ㅣ;ㅓ라ㅣ;ㅁㄴㅁㄴ이ㅏ;러ㅏㅣㅁ;어라ㅣ;ㅁㄴ어ㅏㅣ럼나ㅣ;러ㅏㅣㅁ너라ㅣ;ㅁㄴ어ㅑㅐㄹㅁ너댜ㅐ렂댜ㅐㅣ러ㅑㅐㅁㄴ어ㅑㅐ리;ㅁㄴ어ㅑㅐㅣㄹ머냐ㅐㅇ러ㅑㅐㅁㄴ어ㅑㅐㄹㅁㄴ어ㅑㅐㄹㅁ너ㅑ애러ㅐㅑ;ㅁ어랴ㅐ;ㅁ너ㅑㅐㄹ;ㅁㄴ어ㅑㅐ;ㄹㅁ너ㅑㅐ;ㅇ러ㅑㅐㅁㄴ;러ㅑㅐ;멍랴ㅐ;ㅁㄴ어ㅑㅐ;럼냐ㅐ;러ㅑㅐㅁㄴ러ㅑㅐㅔ;머ㅑㅐㄹ;ㅁ",
                    style: opponentStyle,
                  ),
                ],
                false,
                avatarId,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget renderDmChatBox(List<Widget> contents, bool myMsg, String? avatarId) {
  return Padding(
    padding: const EdgeInsets.only(left: 8),
    child: Column(
      children: [
        Row(
          mainAxisAlignment:
              myMsg ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if (!myMsg)
              UserProfile(
                avatarId: avatarId,
                randomAvatarSize: 30,
              ),
            const SizedBox(width: 15),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 150 * hu,
                maxWidth: 150 * wu,
              ),
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Container(
                  decoration: BoxDecoration(
                    color: myMsg ? Colors.blueAccent : mainSilverColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: contents,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    ),
  );
}
