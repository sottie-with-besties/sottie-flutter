import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class ChatRoomInfo extends StatelessWidget {
  const ChatRoomInfo({
    super.key,
    required this.date,
    required this.location,
    required this.chatTitle,
    required this.latestMsg,
    required this.numOfMember,
  });

  final String date;
  final String location;
  final String chatTitle;
  final String latestMsg;
  final int numOfMember;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150 * wu,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      chatTitle,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16 * hu,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      latestMsg,
                      style: TextStyle(
                        fontSize: 10 * hu,
                        fontWeight: FontWeight.bold,
                        color: const Color(0x84000000),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                overflow: TextOverflow.ellipsis,
                date,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                overflow: TextOverflow.ellipsis,
                location,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
