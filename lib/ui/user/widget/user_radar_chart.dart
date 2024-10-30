import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/user/data_source/user_point_dummy.dart';
import 'package:sottie_flutter/data/user/model/user_point_model.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/controller/show_actions_sheet.dart';
import 'package:sottie_flutter/ui/common/widget/custom_future_builder.dart';
import 'package:sottie_flutter/ui/user/screen/user_review_screen.dart';

class UserRadarChart extends StatelessWidget {
  const UserRadarChart({
    super.key,
    required this.isMe,
  });

  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: mainBlueColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: CustomFutureBuilder(
        futureFunction: getUserPointDummy,
        loadingWidget: SizedBox(
          height: isMe ? 275.5 * hu : 268 * hu,
          child: const Center(
            child: CircularProgressIndicator(
              strokeWidth: 6,
              color: mainBlackColor,
            ),
          ),
        ),
        callBack: (futureData) {
          final userPointModel = futureData as UserPointModel;

          if (userPointModel.participationValue == null) {
            return SizedBox(
              height: 263 * hu,
              child: Center(
                child: Text(isMe ? '등록된 리뷰가 없습니다.' : '친구를 리뷰하세요!'),
              ),
            );
          } else {
            return SizedBox(
              child: Column(
                children: [
                  _CustomRadarChart(
                    participationValue: userPointModel.participationValue!,
                    attitudeValue: userPointModel.attitudeValue!,
                    timeValue: userPointModel.timeValue!,
                    likeabilityValue: userPointModel.likeabilityValue!,
                    trustworthinessValue: userPointModel.trustworthinessValue!,
                  ),
                  SizedBox(height: 10 * hu),
                  Padding(
                    padding: EdgeInsets.only(top: 5 * hu, right: 12 * wu),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        isMe
                            ? OutlinedButton(
                                onPressed: () {
                                  showCustomBottomSheet(
                                    context,
                                    const UserReviewScreen(),
                                  );
                                },
                                child: const Text("리뷰 보기"),
                              )
                            : Container(),
                        Row(
                          children: [
                            Text(
                              "매너 온도",
                              style: TextStyle(
                                fontSize: 10 * hu,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(8)),
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                (userPointModel.participationValue! +
                                        userPointModel.attitudeValue! +
                                        userPointModel.timeValue! +
                                        userPointModel.likeabilityValue! +
                                        userPointModel.trustworthinessValue!)
                                    .toStringAsFixed(1),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10 * hu,
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "°C",
                              style: TextStyle(
                                fontSize: 10 * hu,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5 * hu),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class _CustomRadarChart extends StatefulWidget {
  const _CustomRadarChart({
    required this.participationValue,
    required this.attitudeValue,
    required this.timeValue,
    required this.likeabilityValue,
    required this.trustworthinessValue,
  });

  final double participationValue;
  final double attitudeValue;
  final double timeValue;
  final double likeabilityValue;
  final double trustworthinessValue;

  @override
  State<_CustomRadarChart> createState() => _CustomRadarChartState();
}

class _CustomRadarChartState extends State<_CustomRadarChart> {
  double _participation = 0;
  double _attitude = 0;
  double _time = 0;
  double _likeability = 0;
  double _trustworthiness = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _participation = widget.participationValue;
      _attitude = widget.attitudeValue;
      _time = widget.timeValue;
      _likeability = widget.likeabilityValue;
      _trustworthiness = widget.trustworthinessValue;

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20 * hu),
      child: SizedBox(
        height: 200 * hu,
        child: RadarChart(
          RadarChartData(
            radarShape: RadarShape.polygon,
            radarBorderData: const BorderSide(width: 0.5),
            tickCount: 2,
            tickBorderData: const BorderSide(width: 0.5),
            gridBorderData: const BorderSide(color: Colors.transparent),
            ticksTextStyle: const TextStyle(color: Colors.transparent),
            titlePositionPercentageOffset: 0.2,
            titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
            getTitle: (index, angle) {
              switch (index) {
                case 0:
                  return RadarChartTitle(
                    text: '참여도\n${widget.participationValue}',
                    positionPercentageOffset: 0.1,
                  );
                case 1:
                  return RadarChartTitle(text: '태도\n${widget.attitudeValue}');
                case 2:
                  return RadarChartTitle(text: '약속 시간\n${widget.timeValue}');
                case 3:
                  return RadarChartTitle(
                      text: '호감도\n${widget.likeabilityValue}');
                case 4:
                  return RadarChartTitle(
                      text: '신뢰도\n${widget.trustworthinessValue}');
                default:
                  return const RadarChartTitle(text: '');
              }
            },
            dataSets: <RadarDataSet>[
              RadarDataSet(
                fillColor: Colors.transparent,
                borderColor: Colors.transparent,
                dataEntries: <RadarEntry>[
                  const RadarEntry(value: 20),
                  const RadarEntry(value: 20),
                  const RadarEntry(value: 20),
                  const RadarEntry(value: 20),
                  const RadarEntry(value: 20),
                ],
              ),
              RadarDataSet(
                fillColor: mainBlueColor.withOpacity(0.5),
                borderColor: mainBlueColor,
                dataEntries: <RadarEntry>[
                  RadarEntry(value: _participation),
                  RadarEntry(value: _attitude),
                  RadarEntry(value: _time),
                  RadarEntry(value: _likeability),
                  RadarEntry(value: _trustworthiness),
                ],
              ),
            ],
          ),
          swapAnimationDuration: const Duration(milliseconds: 500),
          // Optional
          swapAnimationCurve: Curves.linear, // Optional
        ),
      ),
    );
  }
}
