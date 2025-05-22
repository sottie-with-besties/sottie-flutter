import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/model/chat/chat_room_model.dart';
import 'package:sottie_flutter/model/post/post_enum.dart';
import 'package:sottie_flutter/model/post/post_model.dart';
import 'package:sottie_flutter/model/user/user_model.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/user/widget/user_profile.dart';

class InChatDrawer extends StatelessWidget {
  const InChatDrawer({super.key, required this.chatRoomModel});

  final ChatRoomModel chatRoomModel;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200 * ScreenSize.wu,
      backgroundColor: AppColors.whiteSilverColor,
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
                      'postModel': PostModel(
                        id: chatRoomModel.id,
                        postCategory: PostCategory.EXERCISE,
                        title: chatRoomModel.title,
                        postLocation: PostLocation.seoul,
                        postDate: chatRoomModel.gatheringDate,
                        contents: chatRoomModel.contents,
                        numOfCurrentPeople: chatRoomModel.currentPeopleNum,
                        numOfPeople: chatRoomModel.peopleNum,
                        numOfCurrentMale: chatRoomModel.currentMaleNum,
                        numOfMale: chatRoomModel.maleNum,
                        numOfCurrentFemale: chatRoomModel.currentFemaleNum,
                        numOfFemale: chatRoomModel.femaleNum,
                        ageFrom: chatRoomModel.ageFrom,
                        ageTo: chatRoomModel.ageTo,
                        genderRestriction: PostGenderRestriction.MIX,
                        mannerRestriction: chatRoomModel.mannerRestriction,
                        ageRestriction: chatRoomModel.ageRestriction,
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
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12 * ScreenSize.hu,
              ),
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
          'model': UserModel(
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
          SizedBox(width: 10 * ScreenSize.wu),
          Text(nickName, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}
