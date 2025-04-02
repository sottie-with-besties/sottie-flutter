import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sottie_flutter/model/user/dto/user_dto.dart';
import 'package:sottie_flutter/repository/user/implements/user_unblock_dummy.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/widget/custom_future_builder.dart';
import 'package:sottie_flutter/ui/user/widget/sottie_user.dart';
import 'package:sottie_flutter/use_case/user/user_use_case.dart';

class UserBlockScreen extends StatefulWidget {
  const UserBlockScreen({super.key});

  @override
  State<UserBlockScreen> createState() => _UserBlockScreenState();
}

class _UserBlockScreenState extends State<UserBlockScreen>
    with AutomaticKeepAliveClientMixin {
  final _userManageProvider = GetIt.I.get<UserUseCase>();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16 * wu),
      child: CustomFutureBuilder(
        futureFunction: getUserBlockDummy,
        callBack: (futureData) {
          final userBlockList = futureData as List<UserDTO>;

          return SingleChildScrollView(
            child: Column(
              children:
                  userBlockList
                      .map(
                        (userBlock) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 10 * hu),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SottieUser(
                                model: userBlock,
                                heroTag: 'userBlock',
                                isMyFriend: false, // Todo: 친구인지 아닌지 확인하는 로직 필요
                                textWidth: 100,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _userManageProvider.userUnblock(context);
                                },
                                child: const Text("차단 해제"),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
            ),
          );
        },
      ),
    );
  }
}
