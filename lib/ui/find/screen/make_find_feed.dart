import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/classification/model/classification.dart';
import 'package:sottie_flutter/ui/find/widget/classification/age_class.dart';
import 'package:sottie_flutter/ui/find/widget/classification/category_class.dart';
import 'package:sottie_flutter/ui/find/widget/classification/date_class.dart';
import 'package:sottie_flutter/ui/find/widget/classification/gender_class.dart';
import 'package:sottie_flutter/ui/find/widget/classification/location_class.dart';
import 'package:sottie_flutter/ui/find/widget/classification/num_of_member_class.dart';
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
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  log(classification.category.toString());
                  log(classification.location.toString());
                  log(classification.date.toString());
                  log(classification.gender.toString());
                  log(classification.minNumOfMember.toString());
                  log(classification.maxNumOfMember.toString());
                  log(classification.minAge.toString());
                  log(classification.maxAge.toString());
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
