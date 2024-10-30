import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/friend/screen/friend_add_screen.dart';
import 'package:sottie_flutter/ui/friend/screen/friend_block_screen.dart';

class FriendUtilScreen extends StatefulWidget {
  const FriendUtilScreen({super.key});

  @override
  State<FriendUtilScreen> createState() => _FriendUtilScreenState();
}

class _FriendUtilScreenState extends State<FriendUtilScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
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
                    "친구 추가",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "차단 목록",
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
                FriendAddScreen(),
                FriendBlockScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
