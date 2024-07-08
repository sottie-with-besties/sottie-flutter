import 'package:flutter/material.dart';
import 'package:sottie_flutter/data/filter/model/category.dart';
import 'package:sottie_flutter/data/filter/model/gender_restrictions.dart';
import 'package:sottie_flutter/data/filter/model/location.dart';

class Filtering {
  final Category category;
  final DateTime? date;
  final TimeOfDay? time;
  final Location? location;
  final GenderRestrictions? gender;
  final int? numOfMember;
  final int? minAge;
  final int? maxAge;
  final double? manner;

  Filtering({
    required this.category,
    this.date,
    this.time,
    this.location,
    this.gender,
    this.numOfMember,
    this.minAge,
    this.maxAge,
    this.manner,
  });
}
