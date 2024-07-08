import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/classification/model/classification.dart';
import 'package:sottie_flutter/ui/find/widget/classification/category_class.dart';

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
            CategoryClass(
              classification: classification,
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: mainBrownColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
              onPressed: () {
                log(classification.category.toString());
              },
              child: const Text(
                "만들기",
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
