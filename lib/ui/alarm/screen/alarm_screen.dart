import 'package:flutter/material.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 100,
            width: 400,
            decoration: BoxDecoration(border: Border.all()),
            child: const Center(
              child: Text("알람"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 100,
            width: 400,
            decoration: BoxDecoration(border: Border.all()),
            child: const Center(
              child: Text("알람"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 100,
            width: 400,
            decoration: BoxDecoration(border: Border.all()),
            child: Center(
              child: Text("알람"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 100,
            width: 400,
            decoration: BoxDecoration(border: Border.all()),
            child: Center(
              child: Text("알람"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 100,
            width: 400,
            decoration: BoxDecoration(border: Border.all()),
            child: Center(
              child: Text("알람"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 100,
            width: 400,
            decoration: BoxDecoration(border: Border.all()),
            child: Center(
              child: Text("알람"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 100,
            width: 400,
            decoration: BoxDecoration(border: Border.all()),
            child: Center(
              child: Text("알람"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
