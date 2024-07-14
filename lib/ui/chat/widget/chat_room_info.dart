import 'package:flutter/material.dart';

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
      width: 150,
      height: 100,
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
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
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
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0x84000000),
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
              SizedBox(
                width: 180,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  date,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 180,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  location,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
