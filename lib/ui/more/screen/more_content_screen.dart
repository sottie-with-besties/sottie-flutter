import 'package:flutter/material.dart';
import 'package:sottie_flutter/data/user/model/user_model.dart';
import 'package:sottie_flutter/domain/user/entity/my_info_entity.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/more/widget/extra_service_list.dart';
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
          padding:
              EdgeInsets.only(bottom: 10 * hu, right: 16 * wu, left: 16 * wu),
          child: SottieUser(
            model: UserModel(
              id: myInfoEntity.id,
              nickname: myInfoEntity.nickName,
              stateMsg: myInfoEntity.stateMessage,
              profileUrl: myInfoEntity.profileUrl,
              mannerTemperature: 42.1,
            ),
            heroTag: 'me',
            isMyFriend: null,
          ),
        ),
        ExtraServiceList(
          setStateProfile: setState,
        ),
      ],
    );
  }
}
