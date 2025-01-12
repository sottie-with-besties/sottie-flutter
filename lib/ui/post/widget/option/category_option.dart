import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/domain/post/entity/post_detail_enum/sottie_category.dart';
import 'package:sottie_flutter/domain/post/entity/post_options_entity.dart';
import 'package:sottie_flutter/ui/post/widget/option/option_title.dart';

class CategoryOption extends StatelessWidget {
  const CategoryOption({
    super.key,
    this.renderAtMakePostScreen = true,
  });

  final bool renderAtMakePostScreen;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (renderAtMakePostScreen) ...[
          const OptionTitle(title: "분류"),
          const SizedBox(width: 30),
        ],
        const _CategoryButtons(),
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
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Wrap(
        spacing: 10,
        children: SottieCategory.values
            .where((category) => category.index != 0)
            .map((category) {
          final isSelected = category == postOptions.gatheringCategory;

          return ChoiceChip(
            label: Text(
              category.koreanName,
              style: TextStyle(
                color: isSelected ? mainWhiteSilverColor : mainBlackColor,
              ),
            ),
            selected: isSelected,
            onSelected: (_) {
              postOptions.gatheringCategory == category
                  ? postOptions.gatheringCategory = SottieCategory.ALL
                  : postOptions.gatheringCategory = category;
              setState(() {});
            },
          );
        }).toList(),
      ),
    );
  }
}
