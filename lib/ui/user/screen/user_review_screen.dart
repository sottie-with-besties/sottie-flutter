import 'package:flutter/material.dart';
import 'package:sottie_flutter/data/user/data_source/user_review_dummy.dart';
import 'package:sottie_flutter/data/user/model/user_review_model.dart';
import 'package:sottie_flutter/ui/common/widget/custom_future_builder.dart';
import 'package:sottie_flutter/ui/user/widget/user_review.dart';

class UserReviewScreen extends StatelessWidget {
  const UserReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder(
      futureFunction: getUserReviewDummy,
      callBack: (futureData) {
        final userReviewModelList = futureData as UserReviewModelList;
        final reviews = userReviewModelList.userReviewModelList;

        if (reviews.isEmpty) {
          return const Center(
            child: Text('리뷰가 없습니다.'),
          );
        } else {
          return SizedBox(
            height: 200,
            child: ListView(
              children: reviews.map<Widget>(
                (data) {
                  return UserReview(model: data);
                },
              ).toList(),
            ),
          );
        }
      },
    );
  }
}
