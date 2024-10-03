import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/post/model/post_detail/sottie_category.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  List<bool> selectedList = List<bool>.generate(
    SottieCategory.values.length,
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
        itemCount: SottieCategory.values.length,
        itemBuilder: (_, index) {
          return ChoiceChip(
            onSelected: (check) {
              _onSelected(index, check);
            },
            label: SizedBox(
              height: 18 * hu,
              child: Row(
                children: [
                  if (SottieCategory.values[index].name == '번개')
                    const Icon(
                      Icons.bolt,
                      color: Colors.amber,
                    ),
                  Text(
                    SottieCategory.values[index].name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            selected: selectedList[index],
            selectedColor: Colors.lightBlueAccent.withOpacity(0.7),
            backgroundColor: mainSilverColor,
            showCheckmark: false,
          );
        },
        separatorBuilder: (_, index) => const SizedBox(width: 10),
      ),
    );
  }
}
