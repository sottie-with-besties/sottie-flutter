import 'package:flutter/material.dart';

class ExtraSettingScreen extends StatefulWidget {
  const ExtraSettingScreen({super.key});

  @override
  State<ExtraSettingScreen> createState() => _ExtraSettingScreenState();
}

class _ExtraSettingScreenState extends State<ExtraSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("환경설정"),
      ),
      body: Column(
        children: [
          Text("Setting"),
        ],
      ),
    );
  }
}
