import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';

class FriendRadarChart extends StatefulWidget {
  const FriendRadarChart({
    super.key,
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
  State<FriendRadarChart> createState() => _FriendRadarChartState();
}

class _FriendRadarChartState extends State<FriendRadarChart> {
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
            radarBorderData:
                const BorderSide(color: mainSilverColor, width: 0.5),
            tickCount: 2,
            tickBorderData:
                const BorderSide(color: mainSilverColor, width: 0.5),
            gridBorderData: const BorderSide(color: Colors.transparent),
            ticksTextStyle: const TextStyle(color: Colors.transparent),
            titlePositionPercentageOffset: 0.2,
            titleTextStyle: const TextStyle(
              color: mainSilverColor,
              fontWeight: FontWeight.bold,
            ),
            getTitle: (index, angle) {
              switch (index) {
                case 0:
                  return RadarChartTitle(
                      text: '참여도\n${widget.participationValue}',
                      positionPercentageOffset: 0.1);
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
                fillColor: Colors.lightBlue.withOpacity(0.2),
                borderColor: Colors.lightBlue,
                dataEntries: <RadarEntry>[
                  RadarEntry(value: _participation),
                  RadarEntry(value: _attitude),
                  RadarEntry(value: _time),
                  RadarEntry(value: _likeability),
                  RadarEntry(value: _trustworthiness),
                ],
              ),
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
            ],
          ),
          swapAnimationDuration: const Duration(milliseconds: 500), // Optional
          swapAnimationCurve: Curves.linear, // Optional
        ),
      ),
    );
  }
}
