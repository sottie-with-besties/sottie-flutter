import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/model/post/post_enum.dart';
import 'package:sottie_flutter/ui/post/controller/post_options_setting.dart';
import 'package:sottie_flutter/ui/post/widget/option/option_title.dart';

class CategoryOption extends StatelessWidget {
  const CategoryOption({super.key, this.renderAtMakePostScreen = true});

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
        children:
            PostCategory.values.where((category) => category.index != 0).map((
              category,
            ) {
              final isSelected =
                  category == postOptionsSetting.gatheringCategory;

              return ChoiceChip(
                label: Text(
                  category.koreanName,
                  style: TextStyle(
                    color:
                        isSelected
                            ? AppColors.whiteSilverColor
                            : AppColors.blackColor,
                  ),
                ),
                selected: isSelected,
                onSelected: (_) {
                  postOptionsSetting.gatheringCategory == category
                      ? postOptionsSetting.gatheringCategory = PostCategory.ALL
                      : postOptionsSetting.gatheringCategory = category;
                  setState(() {});
                },
              );
            }).toList(),
      ),
    );
  }
}
