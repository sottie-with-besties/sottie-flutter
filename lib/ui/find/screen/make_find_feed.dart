import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/classification/model/classification.dart';
import 'package:sottie_flutter/ui/find/widget/classification/age_class.dart';
import 'package:sottie_flutter/ui/find/widget/classification/category_class.dart';
import 'package:sottie_flutter/ui/find/widget/classification/date_class.dart';
import 'package:sottie_flutter/ui/find/widget/classification/gender_class.dart';
import 'package:sottie_flutter/ui/find/widget/classification/location_class.dart';
import 'package:sottie_flutter/ui/find/widget/classification/manner_class.dart';
import 'package:sottie_flutter/ui/find/widget/classification/num_of_member_class.dart';
import 'package:sottie_flutter/ui/find/widget/classification/open_participation_class.dart';
import 'package:sottie_flutter/ui/find/widget/classification/start_same_time_class.dart';
import 'package:sottie_flutter/ui/find/widget/classification/time_class.dart';

class MakeFindFeed extends StatefulWidget {
  const MakeFindFeed({super.key});

  @override
  State<MakeFindFeed> createState() => _MakeFindFeedState();
}

class _MakeFindFeedState extends State<MakeFindFeed> {
  Classification classification = Classification();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CategoryClass(classification: classification),
              const SizedBox(height: 15),
              LocationClass(classification: classification),
              const SizedBox(height: 15),
              DateClass(classification: classification),
              const SizedBox(height: 15),
              TimeClass(classification: classification),
              const SizedBox(height: 15),
              GenderClass(classification: classification),
              const SizedBox(height: 15),
              NumOfMemberClass(classification: classification),
              const SizedBox(height: 15),
              const Text("나이는 만 나이 기준입니다."),
              AgeClass(classification: classification),
              const SizedBox(height: 15),
              MannerClass(classification: classification),
              const SizedBox(height: 15),
              StartSameTimeClass(classification: classification),
              const SizedBox(height: 15),
              OpenParticipationClass(classification: classification),
              const SizedBox(height: 15),
              StartSameTimeClass(classification: classification),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  log(classification.category.toString(), name: "분류");
                  log(classification.location.toString(), name: "장소");
                  log(classification.date.toString(), name: "날짜 및 시간");
                  log(classification.gender.toString(), name: "성별");
                  log(classification.minNumOfMember.toString(),
                      name: "최소 인원 수");
                  log(classification.maxNumOfMember.toString(),
                      name: "최대 인원 수");
                  log(classification.minAge.toString(), name: "최소 나이");
                  log(classification.maxAge.toString(), name: "최대 나이");
                  log(classification.manner.toString(), name: "매너 온도");
                  log(classification.startSameTime.toString(),
                      name: "동시 채팅 시작");
                  log(classification.startNumOfMember.toString(),
                      name: "동시 몇명 시작");
                  log(classification.openParticipation.toString(),
                      name: "오픈 채팅");
                  log(classification.onlyMyFriends.toString(), name: "내 친구만");
                },
                child: const Text(
                  "모집글 생성",
                  style: TextStyle(
                    color: mainSilverColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
