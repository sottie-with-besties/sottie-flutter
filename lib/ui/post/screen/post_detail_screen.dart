import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/post/data_source/post_detail_dummy.dart';
import 'package:sottie_flutter/data/post/model/post_detail_model.dart';
import 'package:sottie_flutter/data/post/model/post_model.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/controller/ui_util.dart';
import 'package:sottie_flutter/ui/common/widget/custom_future_builder.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({
    super.key,
    required this.postModel,
    required this.isWaiting,
  });

  final PostModel postModel;
  final bool isWaiting;

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  final _thumbnailController = PageController();

  // 더미
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
    final date = DateTime.parse(widget.postModel.date);

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ListView(
          physics: const ClampingScrollPhysics(),
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
                    Column(
                      children: [
                        SizedBox(
                          height: 250 * hu,
                          child: PageView.builder(
                            controller: _thumbnailController,
                            itemBuilder: (_, index) {
                              return thumbnail[index % thumbnail.length];
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        SmoothPageIndicator(
                          controller: _thumbnailController,
                          count: thumbnail.length,
                          effect: const WormEffect(
                            dotHeight: 8,
                            dotWidth: 8,
                            activeDotColor: mainBlueColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      postDetailModelData.content,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 250 * hu,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _categoryClassify(widget.postModel.category),
                          _renderMemberCount(widget.postModel),
                          Text(
                              "날짜: ${date.year}년 ${date.month}월 ${date.day}일 ${intToWeekday(date.weekday)} ${renderCustomStringTime(widget.postModel.date, widget.postModel.date)}"),
                          Text("장소: ${widget.postModel.location}"),
                          _renderAgeRange(postDetailModelData.ageRange),
                          Text("매너 온도: ${postDetailModelData.mannerPoint}도 이상"),
                          if (postDetailModelData.startSameTime)
                            const Text(
                                "동시 채팅 시작: 정해진 인원 수만큼 모집될때까지 채팅방이 생성되지 않다가, 정해진 인원 수 만큼 모이면 채팅방이 생성되고 채팅이 시작됩니다."),
                          if (postDetailModelData.openParticipation)
                            const Text(
                                "오픈 채팅: 정해진 모임 날짜로부터 24시간 이후에도 채팅방이 삭제되지 않으며, 채팅방 출입이 자유롭습니다."),
                          if (postDetailModelData.onlyMyFriends)
                            const Text(
                                "오직 내 친구만: 방장의 친구 목록에 등록된 유저만 입장할 수 있습니다."),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: widget.isWaiting
                          ? mainGreenColor.withOpacity(0.8)
                          : mainBlueColor,
                      minimumSize: const Size(100, 65),
                    ),
                    onPressed: () {
                      widget.isWaiting ? log("참여 취소") : log("참여하기");
                    },
                    child: Text(
                      widget.isWaiting ? '참여 취소' : '참여하기',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: mainWhiteSilverColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _renderMemberCount(PostModel model) {
  if (model.maxMemberCount == null &&
      model.maxManCount == null &&
      model.maxWomanCount == null) {
    return const Text("인원 제한 없음");
  } else if (model.currentMemberCount != null &&
      model.currentManCount == null &&
      model.currentWomanCount == null) {
    return Text("인원 수: ${model.currentMemberCount}/${model.maxMemberCount}");
  } else if (model.currentManCount != null && model.currentWomanCount != null) {
    return Row(
      children: [
        const Text("인원 수: "),
        const Icon(
          Icons.man,
          color: Colors.blue,
        ),
        SizedBox(width: 1 * wu),
        Text("${model.currentManCount}/${model.maxManCount}"),
        SizedBox(width: 3 * wu),
        const Icon(
          Icons.woman,
          color: Colors.pinkAccent,
        ),
        SizedBox(width: 1 * wu),
        Text("${model.currentWomanCount}/${model.maxWomanCount}"),
      ],
    );
  } else {
    return Container();
  }
}

Text _renderAgeRange(List<String> ageRange) {
  String ageRangeString = '나이:';

  if (ageRange.isEmpty) {
    ageRangeString = '나이 제한 없음 ';
  }

  if (ageRange.contains('10대')) {
    ageRangeString = '$ageRangeString 10대,';
  }

  if (ageRange.contains('20대')) {
    ageRangeString = '$ageRangeString 20대,';
  }

  if (ageRange.contains('30대')) {
    ageRangeString = '$ageRangeString 30대,';
  }

  if (ageRange.contains('40대')) {
    ageRangeString = '$ageRangeString 40대,';
  }

  if (ageRange.contains('50대')) {
    ageRangeString = '$ageRangeString 50대,';
  }

  if (ageRange.contains('60대')) {
    ageRangeString = '$ageRangeString 60대,';
  }

  if (ageRange.contains('70대')) {
    ageRangeString = '$ageRangeString 70대,';
  }

  if (ageRange.contains('80대 이상')) {
    ageRangeString = '$ageRangeString 80대 이상,';
  }

  return Text(ageRangeString.substring(0, ageRangeString.length - 1));
}

FittedBox _categoryClassify(List<String> categoryList) {
  List<Widget> categories = [];

  if (categoryList.contains('번개')) {
    categories.add(_renderCategory(Icons.bolt, '번개'));
  }

  if (categoryList.contains('친목')) {
    categories.add(_renderCategory(FontAwesomeIcons.userGroup, '친목'));
  }

  if (categoryList.contains('공부')) {
    categories.add(_renderCategory(FontAwesomeIcons.pencil, '공부'));
  }

  if (categoryList.contains('구인/구직')) {
    categories.add(_renderCategory(Icons.note_alt, '구인/구직'));
  }

  if (categoryList.contains('게임')) {
    categories.add(_renderCategory(Icons.gamepad, '게임'));
  }

  if (categoryList.contains('운동')) {
    categories.add(_renderCategory(FontAwesomeIcons.dumbbell, '운동'));
  }

  if (categoryList.contains('기타')) {
    categories.add(_renderCategory(Icons.more_horiz, '기타'));
  }

  return FittedBox(child: Row(children: categories));
}

Widget _renderCategory(IconData icon, String category) {
  return Padding(
    padding: const EdgeInsets.only(right: 10),
    child: Row(
      children: [
        FaIcon(icon),
        const SizedBox(width: 5),
        Text(category),
      ],
    ),
  );
}
