import 'package:flutter/material.dart';
import 'package:sottie_flutter/data/classification/model/classification.dart';
import 'package:sottie_flutter/data/classification/model/location.dart';

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
        const Text(
          "장소",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
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
