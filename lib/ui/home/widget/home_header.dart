import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/domain/find/classification_entity/category.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  List<bool> selectedList = List<bool>.generate(
    Category.values.length,
    (index) => index == 0 ? true : false,
  );

  // All을 체크하면 나머지 카테고리 체크 해제
  void _checkAll() {
    selectedList[0] = true;
    for (int i = 1; i < selectedList.length; i++) {
      selectedList[i] = false;
    }
  }

  // All이 아닌 나머지 카테고리 하나라도 체크되어 있으면 All 체크 해제
  void _checkAnyExceptAll(int index, bool check) {
    selectedList[0] = false;
    selectedList[index] = check;
  }

  void _onSelected(int index, bool check) {
    index == 0 ? _checkAll() : _checkAnyExceptAll(index, check);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: Category.values.length,
        itemBuilder: (_, index) {
          return ChoiceChip(
            onSelected: (check) {
              _onSelected(index, check);
            },
            label: Text(
              Category.values[index].name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            selected: selectedList[index],
            backgroundColor: mainSilverColor,
            checkmarkColor: Colors.green,
            selectedColor: Colors.pinkAccent.withOpacity(0.2),
          );
        },
        separatorBuilder: (_, index) => const SizedBox(width: 10),
      ),
    );
  }
}
