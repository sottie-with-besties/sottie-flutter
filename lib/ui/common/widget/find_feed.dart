import 'package:flutter/material.dart';

class FindFeed extends StatelessWidget {
  const FindFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          width: 400,
          decoration: BoxDecoration(border: Border.all()),
          child: Center(
            child: Text("모집글"),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
