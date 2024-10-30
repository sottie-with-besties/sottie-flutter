import 'package:flutter/material.dart';

class FriendBlockScreen extends StatefulWidget {
  const FriendBlockScreen({super.key});

  @override
  State<FriendBlockScreen> createState() => _FriendBlockScreenState();
}

class _FriendBlockScreenState extends State<FriendBlockScreen> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("친구 차단"),
      ],
    );
  }
}
