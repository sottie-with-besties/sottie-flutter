import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/classification/model/classification.dart';
import 'package:sottie_flutter/ui/find/widget/classification/category_class.dart';
import 'package:sottie_flutter/ui/find/widget/classification/date_class.dart';
import 'package:sottie_flutter/ui/find/widget/classification/location_class.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CategoryClass(classification: classification),
            const SizedBox(height: 15),
            LocationClass(classification: classification),
            const SizedBox(height: 15),
            DateClass(classification: classification),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                log(classification.category.toString());
                log(classification.location.toString());
                log(classification.date.toString());
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
    );
  }
}
