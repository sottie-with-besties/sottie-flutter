import 'package:flutter/material.dart';
import 'package:sottie_flutter/domain/post/classification_entity/category.dart';
import 'package:sottie_flutter/domain/post/classification_entity/classification.dart';
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
        const SizedBox(width: 30),
        _CategoryButtons(classification: classification),
      ],
    );
  }
}

class _CategoryButtons extends StatefulWidget {
  const _CategoryButtons({
    required this.classification,
  });

  final Classification classification;

  @override
  State<_CategoryButtons> createState() => _CategoryButtonsState();
}

class _CategoryButtonsState extends State<_CategoryButtons> {
  List<bool> selectedList = List<bool>.generate(
    CategorySottie.values.length,
    (index) => false,
  );

  List<CategorySottie> tempList = [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Wrap(
        spacing: 10,
        children: CategorySottie.values
            .where((category) => category.index != 0)
            .map((category) {
          return ChoiceChip(
            label: Text(category.name),
            selected: selectedList[category.index],
            onSelected: (onSelected) {
              selectedList[category.index] = onSelected;
              onSelected ? tempList.add(category) : tempList.remove(category);
              widget.classification.category = tempList;
              setState(() {});
            },
          );
        }).toList(),
      ),
    );
  }
}
