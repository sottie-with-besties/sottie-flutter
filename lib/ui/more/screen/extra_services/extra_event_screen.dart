import 'package:flutter/material.dart';

class ExtraEventScreen extends StatelessWidget {
  const ExtraEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("이벤트"),
      ),
      body: Column(
        children: [
          Text("Event"),
        ],
      ),
    );
  }
}
