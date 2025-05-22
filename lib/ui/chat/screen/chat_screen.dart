import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/chat/screen/chat_room_screen.dart';
import 'package:sottie_flutter/ui/chat/screen/chat_room_waiting_screen.dart';
import 'package:sottie_flutter/ui/chat/screen/dm_screen.dart';
import 'package:sottie_flutter/ui/chat/widget/chat_header.dart';
import 'package:sottie_flutter/ui/common/screen/default_layout.dart';

import '../../common/controller/screen_size.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final focusNode = FocusNode();
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => focusNode.unfocus(),
      child: DefaultLayout(
        hasScrollBody: true,
        appBarTitle: '채팅',
        header: ChatHeader(focusNode: focusNode),
        contentChild: Column(
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
            SizedBox(height: 5 * ScreenSize.hu),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  ChatRoomScreen(),
                  ChatRoomWaitingScreen(),
                  DmScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
