import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/post/model/post_detail_enum/sottie_category.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: SottieCategory.values.length,
        itemBuilder: (_, index) {
          final isSelected = value == index;

          return ChoiceChip(
            side: isSelected ? null : const BorderSide(width: 0.8),
            onSelected: (_) {
              value = index;
              setState(() {});
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
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isSelected ? mainWhiteSilverColor : mainBlackColor,
                    ),
                  ),
                ],
              ),
            ),
            selected: isSelected,
            selectedColor: mainBlueColor.withOpacity(0.7),
            backgroundColor: mainWhiteSilverColor,
            showCheckmark: false,
          );
        },
        separatorBuilder: (_, index) => const SizedBox(width: 10),
      ),
    );
  }
}
