import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/core/router/router.dart';
import 'package:sottie_flutter/data/post/model/post_model.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/controller/ui_util.dart';

class Post extends StatelessWidget {
  const Post({
    super.key,
    required this.model,
  });

  final PostModel model;

  @override
  Widget build(BuildContext context) {
    final date = DateTime.parse(model.date);

    return GestureDetector(
      onTap: () => context.push(
        CustomRouter.postDetailPath,
        extra: {
          'postModel': model,
        },
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8 * wu),
        child: Container(
          height: 135 * hu,
          padding: EdgeInsets.all(12.0 * hu),
          decoration: BoxDecoration(
            border: const Border(top: BorderSide(width: 0.3)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 200 * wu,
                    ),
                    child: _categoryClassify(model.category),
                  ),
                  _renderMemberCount(model),
                ],
              ),
              SizedBox(height: 10 * hu),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    width: 110 * wu,
                    height: 70 * hu,
                    child: const Center(
                      child: Text("썸네일"),
                    ),
                  ),
                  SizedBox(
                    width: 150 * wu,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12 * hu,
                          ),
                        ),
                        SizedBox(height: 10 * hu),
                        Text(
                          model.location,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11 * hu,
                          ),
                        ),
                        Text(
                          "${date.year}년 ${date.month}월 ${date.day}일\n${renderCustomStringTime(model.date, model.date)}",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11 * hu,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
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

Widget _renderMemberCount(PostModel model) {
  if (model.maxMemberCount == null &&
      model.maxManCount == null &&
      model.maxWomanCount == null) {
    return const Text("인원 제한 없음");
  } else if (model.currentMemberCount != null &&
      model.currentManCount == null &&
      model.currentWomanCount == null) {
    return Text("${model.currentMemberCount}/${model.maxMemberCount}");
  } else if (model.currentManCount != null && model.currentWomanCount != null) {
    return Row(
      children: [
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
