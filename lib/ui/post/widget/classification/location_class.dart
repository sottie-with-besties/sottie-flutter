import 'package:flutter/material.dart';
import 'package:sottie_flutter/data/post/model/post_detail/location.dart';
import 'package:sottie_flutter/domain/post/post_setting_entity.dart';
import 'package:sottie_flutter/ui/post/widget/classification/classification_title.dart';

class LocationClass extends StatelessWidget {
  const LocationClass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ClassificationTitle(title: "장소"),
        DropdownMenu(
            initialSelection: postSettingEntity.location,
            onSelected: (location) => postSettingEntity.location = location!,
            dropdownMenuEntries: Location.values.map((location) {
              return DropdownMenuEntry(value: location, label: location.name);
            }).toList()),
      ],
    );
  }
}
