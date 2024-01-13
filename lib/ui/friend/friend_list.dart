

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sottie_with_besties/ui/friend/add_friend_page_1.dart';
import 'package:sottie_with_besties/ui/friend/find_friend_page.dart';
import 'package:sottie_with_besties/ui/user/profile_page.dart';

import 'friend_tile.dart';

class FriendListPage extends StatefulWidget {
  const FriendListPage({super.key});

  @override
  _FriendListPageState createState() => _FriendListPageState();
}

class _FriendListPageState extends State<FriendListPage> {

  final formKey = GlobalKey<FormState>();

  // TODO 나중에 레파지토리 친구리스트 조회값으로 변경해야함
  late List<FriendTile> friendTiles = [];

  void _toProfilePage() {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()),);
    });
  }

  @override
  Widget build(BuildContext context) {

    // TODO 나중에 레파지토리 친구리스트 조회값으로 변경해야함
    if(friendTiles.isNotEmpty) {
      friendTiles.clear();
    }
    for (int x = 1; x <= 5; x++) {
      friendTiles.add(
          FriendTile(
            nickName: '이한솔',
            moodStatus: '',
            introPhrase: '이한솔이다',
            imgUrl: 'https://picsum.photos/45/45',
          )
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        // title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const FindFriendPage()),);
            },
          ),
          SizedBox(width: 6),
          IconButton(
            icon: const Icon(Icons.person_add_alt),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AddFriend1Page()),);
            },
          ),
          SizedBox(width: 6),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 64,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.only(left: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          text: '내 프로필',
                        ),
                  ),
                ),
                SizedBox(height: 8),
                //내 정보
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: _toProfilePage,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network('https://picsum.photos/50/50'),
                      ),
                      SizedBox(width: 12),
                      Text(
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        'SFAC',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Divider(thickness: 1), // 구분 선
                //친구 수 텍스트
                Text(
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                  '친구 ' + friendTiles.length.toString(),
                ),
              ],
            ),
          ),
          //친구 리스트 뷰
          Expanded(
            child: ListView(
              children: friendTiles,
            ),
          )
        ],
      ),
      // 하단 바
      // bottomNavigationBar: BottomNavigationBar(
      //   showSelectedLabels: false,
      //   showUnselectedLabels: false,
      //   selectedItemColor: Colors.black,
      //   type: BottomNavigationBarType.fixed,
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'person'),
      //     // 채팅 아이콘에 알림 뱃지 추가
      //     BottomNavigationBarItem(
      //         icon: Stack(
      //           clipBehavior: Clip.none,
      //           children: [
      //             Icon(Icons.chat_bubble_outline),
      //             Positioned(
      //               right: -10,
      //               top: -5,
      //               child: Container(
      //                 padding: EdgeInsets.all(2),
      //                 alignment: Alignment.center,
      //                 decoration: BoxDecoration(
      //                   color: Colors.red,
      //                   borderRadius: BorderRadius.circular(4),
      //                 ),
      //                 constraints: BoxConstraints(
      //                   minHeight: 12,
      //                   minWidth: 12,
      //                 ),
      //                 child: Text(
      //                   '99+',
      //                   style: TextStyle(
      //                     color: Colors.white,
      //                     fontSize: 10,
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //         label: 'chat'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.visibility_outlined), label: 'visible'),
      //     BottomNavigationBarItem(icon: Icon(Icons.storefront), label: 'store'),
      //     BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'more'),
      //   ],
      // ),
    );
  }
}