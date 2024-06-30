import 'package:flutter/material.dart';
import 'package:sottie_flutter/ui/common/widget/local_text_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        LocalTextField(
          hint: "날짜, 장소, 제목, 내용...",
          focusNode: focusNode,
        ),
      ],
    );
  }
}
