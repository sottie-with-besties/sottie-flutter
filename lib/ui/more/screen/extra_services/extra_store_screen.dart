import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/more/widget/remain_gold.dart';

class ExtraStoreScreen extends StatefulWidget {
  const ExtraStoreScreen({super.key});

  @override
  State<ExtraStoreScreen> createState() => _ExtraStoreScreenState();
}

class _ExtraStoreScreenState extends State<ExtraStoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("상점"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RemainGold(),
              const SizedBox(height: 30),
              const Text(
                "골드 구매",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 15),
              _goldPurchase(1000, 1400),
              _goldPurchase(3000, 5000),
              _goldPurchase(5000, 7000),
              _goldPurchase(10000, 12000),
              const SizedBox(height: 50),
              termsAndConditions("골드 충전 후 7일 이내, 사용하지 않은 골드만 결제 취소가 가능합니다."),
              termsAndConditions("법정대리인의 동의 없는 미성년자의 결제는 취소될 수 있습니다."),
              termsAndConditions("위 표기된 금액은 부가가치세(10%)가 포함된 금액입니다."),
              termsAndConditions("골드 충전 후 7일 이내, 사용하지 않은 골드만 결제 취소가 가능합니다."),
              termsAndConditions("골드 충전 후 7일 이내, 사용하지 않은 골드만 결제 취소가 가능합니다."),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _goldPurchase(int gold, int price) {
  return GestureDetector(
    // Todo: 인 앱 구매 구현하기
    onTap: () => log("In App Purchase"),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.3),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 30 * hu,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const FaIcon(
                  FontAwesomeIcons.coins,
                  color: Colors.amber,
                ),
                const SizedBox(width: 10),
                Text(gold.toString()),
              ],
            ),
            Row(
              children: [
                Text(
                  price.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text("  원"),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget termsAndConditions(String content) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Text(
      "* $content",
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 12,
      ),
    ),
  );
}
