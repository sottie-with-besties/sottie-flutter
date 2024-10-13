import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/friend/model/friend_detail_model.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/widget/user_profile.dart';

class FriendReview extends StatelessWidget {
  const FriendReview({
    super.key,
    required this.model,
  });

  final FriendReviewModel model;

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
                      color: mainWhiteSilverColor,
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
                    color: mainWhiteSilverColor,
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
    const chipLabel = ["매우 나쁨", "나쁨", "보통", "좋음", "매우 좋음"];

    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            evaluationText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12 * hu,
              color: mainWhiteSilverColor,
            ),
          ),
          SizedBox(width: 5 * wu),
          ...List.generate(
            5,
            (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ChoiceChip(
                  selectedColor: Colors.green.withOpacity(0.8),
                  checkmarkColor: Colors.black,
                  disabledColor: Colors.grey.withOpacity(0.5),
                  label: Text(
                    chipLabel[index],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  selected: index == selectedIndex,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
