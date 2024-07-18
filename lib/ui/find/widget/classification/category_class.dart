import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/domain/find/classification_entity/category.dart';
import 'package:sottie_flutter/domain/find/classification_entity/classification.dart';
import 'package:sottie_flutter/ui/find/widget/classification/classification_title.dart';

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
        const ClassificationTitle(title: "분류"),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: MultiSelectDropDown<int>(
            borderColor: Colors.black,
            borderWidth: 0.5,
            borderRadius: 5,
            hint: "기타",
            optionsBackgroundColor: mainSilverColor,
            hintColor: Colors.black,
            onOptionSelected: (selectedOptions) {
              classification.category = selectedOptions
                  .map((val) => Category.values[val.value!])
                  .toList();
            },
            options: Category.values.where((val) => val.index != 0).map((val) {
              return ValueItem(label: val.name, value: val.index);
            }).toList(),
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
