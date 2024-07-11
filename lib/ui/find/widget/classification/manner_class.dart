import 'package:flutter/material.dart';

class MannerClass extends StatelessWidget {
  const MannerClass({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "매너 온도",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}

class _MannerSelector extends StatefulWidget {
  const _MannerSelector();

  @override
  State<_MannerSelector> createState() => _MannerSelectorState();
}

class _MannerSelectorState extends State<_MannerSelector> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
