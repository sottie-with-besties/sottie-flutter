import 'package:flutter/material.dart';
import 'package:sottie_flutter/model/post/entity/post_detail_enum/post_location.dart';
import 'package:sottie_flutter/ui/post/controller/post_options_setting.dart';
import 'package:sottie_flutter/ui/post/widget/option/option_title.dart';

class LocationOption extends StatelessWidget {
  const LocationOption({super.key, this.renderAtMakePostScreen = true});

  final bool renderAtMakePostScreen;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (renderAtMakePostScreen) ...[
          const OptionTitle(title: '장소'),
          const SizedBox(width: 20),
        ],
        Expanded(
          child: DropdownMenu(
            initialSelection: postOptionsSetting.locationId,
            expandedInsets: const EdgeInsets.all(0),
            onSelected: (location) => postOptionsSetting.locationId = location!,
            dropdownMenuEntries:
                PostLocation.values.map((location) {
                  return DropdownMenuEntry(
                    value: location.index,
                    label: location.koreanName,
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }
}
