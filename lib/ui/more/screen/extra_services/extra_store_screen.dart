import 'package:flutter/material.dart';

class ExtraStoreScreen extends StatefulWidget {
  const ExtraStoreScreen({super.key});

  @override
  State<ExtraStoreScreen> createState() => _ExtraStoreScreenState();
}

class _ExtraStoreScreenState extends State<ExtraStoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("Store"),
        ],
      ),
    );
  }
}
