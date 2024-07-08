import 'package:flutter/material.dart';
import 'package:sottie_flutter/data/classification/model/category.dart';
import 'package:sottie_flutter/data/classification/model/gender_restrictions.dart';
import 'package:sottie_flutter/data/classification/model/location.dart';

class Classification {
  List<Category>? category;
  DateTime? date;
  TimeOfDay? time;
  Location? location;
  GenderRestrictions? gender;
  int? numOfMember;
  int? minAge;
  int? maxAge;
  double? manner;

  Classification({
    this.category,
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
