import 'package:flutter/material.dart';

void main() {
  runApp(const Sottie());
}

class Sottie extends StatelessWidget {
  const Sottie({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sottie',
      home: Scaffold(
        body: Center(
          child: Text("Sottie"),
        ),
      ),
    );
  }
}
