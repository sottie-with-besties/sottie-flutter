import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/domain/find/classification_entity/model/category.dart';
import 'package:sottie_flutter/ui/home/controller/home_header_controller.dart';

class HomeHeader extends ConsumerWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedList = ref.watch(homeHeaderControllerProvider);

    void onSelected(int index, bool check) {
      final selectFunc = ref.read(homeHeaderControllerProvider.notifier);
      index == 0
          ? selectFunc.checkAll()
          : selectFunc.checkAnyExceptAll(index, check);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: Category.values.length,
        itemBuilder: (_, index) {
          return ChoiceChip(
            onSelected: (check) {
              onSelected(index, check);
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
