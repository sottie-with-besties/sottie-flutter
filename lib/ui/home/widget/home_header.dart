import 'package:flutter/material.dart';
import 'package:sottie_flutter/data/category.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: Category.lengthOfCategory(),
        itemBuilder: (_, index) {
          return ChoiceChip(
            label: Text(
              Category.getByIndex(index).name,
            ),
            selected: true,
          );
        },
        separatorBuilder: (_, index) => const SizedBox(width: 10),
      ),
    );
  }
}
