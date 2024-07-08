import 'package:flutter/material.dart';
import 'package:sottie_flutter/data/classification/model/category.dart';
import 'package:sottie_flutter/data/classification/model/gender_restrictions.dart';
import 'package:sottie_flutter/data/classification/model/location.dart';

class Classification {
  final Category? category;
  final DateTime? date;
  final TimeOfDay? time;
  final Location? location;
  final GenderRestrictions? gender;
  final int? numOfMember;
  final int? minAge;
  final int? maxAge;
  final double? manner;

  Classification({
    this.category = Category.others,
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
