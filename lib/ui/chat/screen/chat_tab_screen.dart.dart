import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/chat/screen/chat_room_generated_content_screen.dart';
import 'package:sottie_flutter/ui/chat/screen/chat_room_not_generated_content_screen.dart';
import 'package:sottie_flutter/ui/chat/screen/dm_content_screen.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class ChatTabScreen extends StatefulWidget {
  const ChatTabScreen({super.key});

  @override
  State<ChatTabScreen> createState() => _ChatTabScreenState();
}

class _ChatTabScreenState extends State<ChatTabScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TabBar(
            controller: _tabController,
            indicatorColor: Colors.blueAccent,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: const <Widget>[
              Tab(
                child: Text(
                  "채팅",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "채팅 대기",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "DM",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5 * hu),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              ChatRoomGeneratedContentScreen(),
              ChatRoomNotGeneratedContentScreen(),
              DmContentScreen(),
            ],
          ),
        ),
      ],
    );
  }
}
