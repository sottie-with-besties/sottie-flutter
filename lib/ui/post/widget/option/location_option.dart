import 'package:flutter/material.dart';
import 'package:sottie_flutter/data/post/model/post_detail_enum/sottie_location.dart';
import 'package:sottie_flutter/domain/post/post_setting_entity.dart';
import 'package:sottie_flutter/ui/post/widget/option/option_title.dart';

class LocationOption extends StatelessWidget {
  const LocationOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const OptionTitle(title: "장소"),
        DropdownMenu(
            initialSelection: postSettingEntity.location,
            onSelected: (location) => postSettingEntity.location = location!,
            dropdownMenuEntries: SottieLocation.values.map((location) {
              return DropdownMenuEntry(value: location, label: location.name);
            }).toList()),
      ],
    );
  }
}
