import 'package:flutter/material.dart';
import 'package:sottie_flutter/domain/post/classification_entity/classification.dart';
import 'package:sottie_flutter/domain/post/classification_entity/location.dart';
import 'package:sottie_flutter/ui/find/widget/classification/classification_title.dart';

class LocationClass extends StatelessWidget {
  const LocationClass({
    super.key,
    required this.classification,
  });

  final Classification classification;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ClassificationTitle(title: "장소"),
        DropdownMenu(
            initialSelection: classification.location,
            onSelected: (location) => classification.location = location!,
            dropdownMenuEntries: Location.values.map((location) {
              return DropdownMenuEntry(value: location, label: location.name);
            }).toList()),
      ],
    );
  }
}
