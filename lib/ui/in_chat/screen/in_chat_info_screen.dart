import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/post/data_source/post_detail_dummy.dart';
import 'package:sottie_flutter/data/post/model/post_detail_model.dart';
import 'package:sottie_flutter/data/post/model/post_model.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/controller/ui_util.dart';
import 'package:sottie_flutter/ui/common/widget/current_num_of_member.dart';
import 'package:sottie_flutter/ui/common/widget/custom_future_builder.dart';
import 'package:sottie_flutter/ui/common/widget/sottie_category_ui.dart';

class InChatInfoScreen extends StatefulWidget {
  const InChatInfoScreen({
    super.key,
    required this.postModel,
  });

  final PostModel postModel;

  @override
  State<InChatInfoScreen> createState() => _InChatInfoScreenState();
}

class _InChatInfoScreenState extends State<InChatInfoScreen> {
  final _thumbnailController = PageController();

  /// 더미
  final thumbnail = List.generate(
      3,
      (index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: mainGreyColor.shade300,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: Center(
                child: Text(
              "Thumbnail $index",
              style: const TextStyle(color: Colors.black),
            )),
          ));

  @override
  void dispose() {
    super.dispose();
    _thumbnailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ListView(
          children: [
            Text(
              widget.postModel.title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomFutureBuilder(
              futureFunction: getPostDetailDummy,
              loadingWidget: const Center(
                child: CircularProgressIndicator(color: Colors.black),
              ),
              callBack: (futureData) {
                final postDetailModelData = futureData as PostDetailModel;

                return Column(
                  children: [
                    Text(
                      postDetailModelData.content,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 250 * hu,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SottieCategoryUi(
                              sottieCategory: widget.postModel.category),
                          CurrentNumOfMember(
                            currentMemberCount:
                                widget.postModel.currentMemberCount,
                            maxMemberCount: widget.postModel.maxMemberCount,
                            currentManCount: widget.postModel.currentManCount,
                            maxManCount: widget.postModel.maxManCount,
                            currentWomanCount:
                                widget.postModel.currentWomanCount,
                            maxWomanCount: widget.postModel.maxWomanCount,
                          ),
                          Text("날짜: ${widget.postModel.date}"),
                          Text("장소: ${widget.postModel.location}"),
                          Text(convertAgeRangeToString(
                              postDetailModelData.ageRange)),
                          Text("매너 온도: ${postDetailModelData.mannerPoint}도 이상"),
                          if (postDetailModelData.startSameTime)
                            const Text("동시 채팅 시작"),
                          if (postDetailModelData.onlyMyFriends)
                            const Text("내 친구만"),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
