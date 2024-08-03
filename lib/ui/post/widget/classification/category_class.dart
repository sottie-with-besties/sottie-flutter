import 'package:flutter/material.dart';
import 'package:sottie_flutter/data/post/model/post_detail/category_sottie.dart';
import 'package:sottie_flutter/domain/post/make_post_detail_entity.dart';
import 'package:sottie_flutter/ui/post/widget/classification/classification_title.dart';

class CategoryClass extends StatelessWidget {
  const CategoryClass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClassificationTitle(title: "분류"),
        SizedBox(width: 30),
        _CategoryButtons(),
      ],
    );
  }
}

class _CategoryButtons extends StatefulWidget {
  const _CategoryButtons();

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
  void initState() {
    super.initState();

    // 검색 스크린에서 필터링 시 데이터 유지
    for (CategorySottie i in makePostDetailEntity.category) {
      selectedList[i.index] = true;
    }
    setState(() {});
  }

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
              makePostDetailEntity.category = tempList;
              setState(() {});
            },
          );
        }).toList(),
      ),
    );
  }
}
