import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/common/widget/user_profile.dart';

class FriendReview extends StatelessWidget {
  const FriendReview({
    super.key,
    required this.nickname,
    required this.mannerPoint,
    required this.reviewText,
  });

  final String nickname;
  final int mannerPoint;
  final String reviewText;

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
                  const UserProfile(randomAvatarSize: 30),
                  const SizedBox(width: 15),
                  Text(
                    nickname,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: mainSilverColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  ...List.generate(
                    5,
                    (index) {
                      if (mannerPoint < index * 20 + 10) {
                        return const Icon(Icons.star_border_outlined);
                      } else if (mannerPoint >= index * 20 + 10 &&
                          mannerPoint < index * 20 + 20) {
                        return const Icon(
                          Icons.star_half,
                          color: Colors.amber,
                        );
                      } else if (mannerPoint >= index * 20 + 20) {
                        return const Icon(
                          Icons.star,
                          color: Colors.amber,
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                  const SizedBox(width: 10),
                  Text(
                    mannerPoint.toString(),
                    style: const TextStyle(
                      color: mainSilverColor,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              reviewText,
              style: const TextStyle(
                color: mainSilverColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
