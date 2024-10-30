import 'package:flutter/material.dart';

class FriendAddScreen extends StatefulWidget {
  const FriendAddScreen({super.key});

  @override
  State<FriendAddScreen> createState() => _FriendAddScreenState();
}

class _FriendAddScreenState extends State<FriendAddScreen> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("친구 추가"),
      ],
    );
  }
}
