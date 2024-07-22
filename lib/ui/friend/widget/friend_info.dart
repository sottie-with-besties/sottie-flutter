import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class FriendInfo extends StatelessWidget {
  const FriendInfo({
    super.key,
    required this.friendName,
    required this.stateMsg,
  });

  final String friendName;
  final String stateMsg;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180 * wu,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            overflow: TextOverflow.ellipsis,
            friendName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 5 * hu),
          Text(
            overflow: TextOverflow.ellipsis,
            stateMsg,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0x84000000),
            ),
          ),
        ],
      ),
    );
  }
}
