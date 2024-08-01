import 'package:flutter/material.dart';

class ExtraGuideScreen extends StatefulWidget {
  const ExtraGuideScreen({super.key});

  @override
  State<ExtraGuideScreen> createState() => _ExtraGuideScreenState();
}

class _ExtraGuideScreenState extends State<ExtraGuideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("Guide"),
        ],
      ),
    );
  }
}
