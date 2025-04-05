import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/model/chat/entity/chat_room_entity.dart';
import 'package:sottie_flutter/model/post/dto/post_dto.dart';
import 'package:sottie_flutter/model/post/entity/post_entity.dart';
import 'package:sottie_flutter/model/user/dto/user_dto.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/widget/user_profile.dart';

class InChatDrawer extends StatelessWidget {
  const InChatDrawer({super.key, required this.chatRoomEntity});

  final ChatRoomEntity chatRoomEntity;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200 * wu,
      backgroundColor: mainWhiteSilverColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _subTitle('채팅방 정보', () {
                  context.push(
                    "${CustomRouter.chatPath}/${CustomRouter.inChatPath}/${CustomRouter.inChatInfoPath}",
                    extra: {
                      'postEntity': PostEntity.fromDTO(
                        model: PostDTO(
                          id: chatRoomEntity.id,
                          gatheringCategory: chatRoomEntity.gatheringCategory,
                          title: chatRoomEntity.title,
                          locationId: chatRoomEntity.locationId,
                          gatheringDate: chatRoomEntity.gatheringDate,
                          contents: chatRoomEntity.contents,
                          currentPeopleNum: chatRoomEntity.currentPeopleNum,
                          peopleNum: chatRoomEntity.peopleNum,
                          currentMaleNum: chatRoomEntity.currentMaleNum,
                          maleNum: chatRoomEntity.maleNum,
                          currentFemaleNum: chatRoomEntity.currentFemaleNum,
                          femaleNum: chatRoomEntity.femaleNum,
                          ageFrom: chatRoomEntity.ageFrom,
                          ageTo: chatRoomEntity.ageTo,
                          genderRestriction: chatRoomEntity.genderRestriction,
                          mannerRestriction: chatRoomEntity.mannerRestriction,
                          ageRestriction: chatRoomEntity.ageRestriction,
                        ),
                      ),
                    },
                  );
                }),
                _subTitle('참여자', null, tapInto: false),
                _inChatParticipant(context, 13461234567, "김진표", null),
                _inChatParticipant(context, 123423142413, "김진표", null),
                _inChatParticipant(context, 568344568, "김진표", null),
                _inChatParticipant(context, 1253412345, "김진표", null),
                _inChatParticipant(context, 4567845678, "김진표", null),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _subTitle(String title, VoidCallback? onTap, {bool tapInto = true}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12 * hu),
            ),
            tapInto ? const Icon(Icons.arrow_right_alt) : Container(),
          ],
        ),
      ),
    ),
  );
}

Widget _inChatParticipant(
  BuildContext context,
  int id,
  String nickName,
  String? profileUrl,
) {
  return InkWell(
    onTap: () {
      context.push(
        CustomRouter.userDetailPath,
        extra: {
          'model': UserDTO(
            id: id,
            nickname: nickName,
            stateMsg: '',
            profileUrl: profileUrl,
            mannerTemperature: 39.2,
          ),
          'heroTag': '',
          'isMyFriend': false, // Todo: 내 친구인지 확인하는 로직
        },
      );
    },
    child: Padding(
      padding: const EdgeInsets.only(left: 12, bottom: 12),
      child: Row(
        children: [
          const UserProfile(),
          SizedBox(width: 10 * wu),
          Text(nickName, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}
