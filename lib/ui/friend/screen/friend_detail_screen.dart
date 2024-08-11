import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/widget/user_profile.dart';
import 'package:sottie_flutter/ui/friend/widget/friend_dm_tab.dart';
import 'package:sottie_flutter/ui/friend/widget/friend_review_tab.dart';
import 'package:sottie_flutter/ui/friend/widget/friend_type_box.dart';

class FriendDetailScreen extends StatefulWidget {
  const FriendDetailScreen({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State<FriendDetailScreen> createState() => _FriendDetailScreenState();
}

class _FriendDetailScreenState extends State<FriendDetailScreen>
    with TickerProviderStateMixin {
  final _focusNode = FocusNode();
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _focusNode.unfocus,
      child: Scaffold(
        appBar: AppBar(backgroundColor: const Color(0x00a0522d)),
        backgroundColor: lightBrownColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Hero(
                    tag: widget.id,
                    child: UserProfile(
                      avatarId: widget.id,
                      randomAvatarSize: 50,
                    ),
                  ),
                  SizedBox(
                    width: 225 * wu,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "김진표",
                          style: TextStyle(
                            color: mainSilverColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16 * wu,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "안녕하세요 수원 사는 2000년생 김진표 입니다.",
                          style: TextStyle(
                            color: mainSilverColor,
                            fontSize: 12 * wu,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12 * hu),
              TabBar(
                controller: _tabController,
                indicatorColor: Colors.blueAccent,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const <Widget>[
                  Tab(
                    child: Text(
                      "DM",
                      style: TextStyle(
                        color: mainSilverColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Review",
                      style: TextStyle(
                        color: mainSilverColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5 * hu),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      child: Column(
                        children: [
                          FriendDmTab(avatarId: widget.id),
                          SizedBox(height: 5 * hu),
                          FriendTypeBox(focusNode: _focusNode),
                        ],
                      ),
                    ),
                    const FriendReviewTab(),
                  ],
                ),
              ),
              // FriendDmBox(avatarId: widget.id),
              // SizedBox(height: 5 * hu),
              // FriendTypeBox(focusNode: focusNode),
            ],
          ),
        ),
      ),
    );
  }
}
