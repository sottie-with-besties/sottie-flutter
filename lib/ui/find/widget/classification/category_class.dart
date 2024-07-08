import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/classification/model/category.dart';
import 'package:sottie_flutter/data/classification/model/classification.dart';

class CategoryClass extends StatelessWidget {
  const CategoryClass({
    super.key,
    required this.classification,
  });

  final Classification classification;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "분류",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: MultiSelectDropDown<int>(
            onOptionSelected: (selectedOptions) {
              classification.category = selectedOptions
                  .map((val) => Category.getByIndex(val.value!))
                  .toList();
            },
            options: <ValueItem<int>>[
              ValueItem(
                label: Category.date.name,
                value: 1,
              ),
              ValueItem(
                label: Category.drinking.name,
                value: 2,
              ),
              ValueItem(
                label: Category.study.name,
                value: 3,
              ),
              ValueItem(
                label: Category.hiring.name,
                value: 4,
              ),
              ValueItem(label: Category.travel.name, value: 5),
              ValueItem(
                label: Category.game.name,
                value: 6,
              ),
              ValueItem(
                label: Category.party.name,
                value: 7,
              ),
              ValueItem(
                label: Category.exercise.name,
                value: 8,
              ),
              ValueItem(
                label: Category.others.name,
                value: 9,
              ),
            ],
            chipConfig: const ChipConfig(
              wrapType: WrapType.wrap,
              backgroundColor: mainBrownColor,
            ),
            dropdownHeight: 300,
            optionTextStyle: const TextStyle(fontSize: 16),
            selectedOptionIcon: const Icon(
              Icons.check_circle,
              color: mainBrownColor,
            ),
          ),
        ),
      ],
    );
  }
}
