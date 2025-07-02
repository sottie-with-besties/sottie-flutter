import 'package:flutter/material.dart';
import 'package:sottie_flutter/model/user/user_model.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/more/widget/extra_service_list.dart';
import 'package:sottie_flutter/ui/user/controller/my_info_controller.dart';
import 'package:sottie_flutter/ui/user/widget/sottie_user.dart';

class MoreContentScreen extends StatefulWidget {
  const MoreContentScreen({super.key});

  @override
  State<MoreContentScreen> createState() => _MoreContentScreenState();
}

class _MoreContentScreenState extends State<MoreContentScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: 10 * ScreenSize.hu,
            right: 16 * ScreenSize.wu,
            left: 16 * ScreenSize.wu,
          ),
          child: SottieUser(
            model: UserModel(
              id: MyInfoController.id,
              nickname: MyInfoController.nickName,
              stateMsg: MyInfoController.stateMessage,
              profileUrl: MyInfoController.profileUrl,
              mannerTemperature: 42.1,
            ),
            heroTag: 'me',
            isMyFriend: null,
          ),
        ),
        ExtraServiceList(setStateProfile: setState),
      ],
    );
  }
}
