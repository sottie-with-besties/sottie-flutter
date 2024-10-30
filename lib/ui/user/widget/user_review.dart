import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/user/model/user_review_model.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/widget/user_profile.dart';

class UserReview extends StatelessWidget {
  const UserReview({
    super.key,
    required this.model,
  });

  final UserReviewModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  UserProfile(profileUrl: model.id, randomAvatarSize: 30),
                  const SizedBox(width: 15),
                  Text(
                    model.nickname,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text(
                  model.total.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14 * hu,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          _EvaluationRow(
              evaluationText: "참여도", selectedIndex: model.participationIndex),
          _EvaluationRow(
              evaluationText: "태도", selectedIndex: model.attitudeIndex),
          _EvaluationRow(
              evaluationText: "약속 시간", selectedIndex: model.timeIndex),
          _EvaluationRow(
              evaluationText: "호감도", selectedIndex: model.likeabilityIndex),
          _EvaluationRow(
              evaluationText: "신뢰도", selectedIndex: model.trustworthinessIndex),
        ],
      ),
    );
  }
}

class _EvaluationRow extends StatelessWidget {
  const _EvaluationRow({
    required this.evaluationText,
    required this.selectedIndex,
  });

  final String evaluationText;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    const chipLabel = ["0", "5", "10", "15", "20"];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 50 * wu,
          child: Text(
            evaluationText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12 * wu,
            ),
          ),
        ),
        ...List.generate(
          5,
          (index) {
            return ChoiceChip(
              selectedColor: mainGreenColor,
              disabledColor: mainGreyColor.withOpacity(0.5),
              showCheckmark: false,
              label: Text(
                chipLabel[index],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              selected: index == selectedIndex,
            );
          },
        ),
      ],
    );
  }
}
