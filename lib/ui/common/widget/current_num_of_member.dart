import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/domain/post/entity/post_detail_enum/post_gender_restriction.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class CurrentNumOfMember extends StatelessWidget {
  const CurrentNumOfMember({
    super.key,
    required this.currentPeopleNum,
    required this.peopleNum,
    required this.currentMaleNum,
    required this.maleNum,
    required this.currentFemaleNum,
    required this.femaleNum,
    required this.genderRestriction,
  });

  final int currentPeopleNum;
  final int peopleNum;
  final int currentMaleNum;
  final int maleNum;
  final int currentFemaleNum;
  final int femaleNum;
  final PostGenderRestriction genderRestriction;

  @override
  Widget build(BuildContext context) {
    if (genderRestriction == PostGenderRestriction.NONE) {
      return Row(
        children: [
          Icon(
            Icons.person,
            color: mainBlackColor,
            size: 12 * hu,
          ),
          SizedBox(width: 1 * wu),
          Text(
            "$currentPeopleNum/$peopleNum",
            style: const TextStyle(
              color: mainBlackColor,
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Icon(
            Icons.person,
            color: Colors.blue,
            size: 12 * hu,
          ),
          SizedBox(width: 1 * wu),
          Text(
            "$currentMaleNum/$maleNum",
            style: const TextStyle(
              color: mainBlackColor,
            ),
          ),
          SizedBox(width: 3 * wu),
          Icon(
            Icons.person,
            color: Colors.pinkAccent,
            size: 12 * hu,
          ),
          SizedBox(width: 1 * wu),
          Text(
            "$currentFemaleNum/$femaleNum",
            style: const TextStyle(
              color: mainBlackColor,
            ),
          ),
        ],
      );
    }
  }
}
