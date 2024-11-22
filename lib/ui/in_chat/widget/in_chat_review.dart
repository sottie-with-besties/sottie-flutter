import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/ui/common/controller/screen_size.dart';
import 'package:sottie_flutter/ui/common/widget/user_profile.dart';

class InChatReview extends StatefulWidget {
  const InChatReview({
    super.key,
    required this.profileUrl,
    required this.nickName,
  });

  final String profileUrl;
  final String nickName;

  @override
  State<InChatReview> createState() => _InChatReviewState();
}

class _InChatReviewState extends State<InChatReview> {
  final _centerOfProfile = 135 * wu;
  final _leftOfProfile = 20 * wu;
  final _rightOfProfile = 250 * wu;

  int _duration = 10;
  Curve _curve = Curves.linear;

  double _boxOpacity = 1;

  double _goodExplanationBoxOpacity = 0;
  double _badExplanationBoxOpacity = 0;

  double _profilePosition = 135 * wu;

  List<Color> _renderGradient() {
    if (_profilePosition < _centerOfProfile) {
      return <Color>[
        mainGreenColor,
        mainWhiteSilverColor,
      ];
    } else if (_profilePosition > _centerOfProfile) {
      return <Color>[
        mainWhiteSilverColor,
        mainRedColor,
      ];
    } else {
      return <Color>[
        mainWhiteSilverColor,
        mainWhiteSilverColor,
      ];
    }
  }

  List<double> _renderStops() {
    double stop = 1 / _profilePosition * 50 + 0.25;

    if (_profilePosition == _leftOfProfile) {
      return <double>[
        0,
        0.99,
      ];
    } else if (_profilePosition == _rightOfProfile) {
      return <double>[
        0.01,
        1,
      ];
    } else if (_profilePosition < _centerOfProfile) {
      if (stop > 0.99) {
        stop = 0.99;
      }
      return <double>[
        0,
        stop,
      ];
    } else if (_profilePosition > _centerOfProfile) {
      if (stop < 0.01) {
        stop = 0.01;
      }
      return <double>[
        stop - 0.2,
        1,
      ];
    } else {
      return <double>[0, 1];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: _duration),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: _renderGradient(),
              stops: _renderStops(),
            ),
          ),
          height: 80 * hu,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _renderReviewPoint(_boxOpacity, _duration, mainGreenColor.shade400,
                Icons.thumb_up_alt_outlined, '좋아요'),
            _renderReviewPoint(_boxOpacity, _duration, mainRedColor,
                Icons.thumb_down_alt_outlined, '싫어요'),
          ],
        ),
        _renderReviewExplanation(
          90 * wu,
          _goodExplanationBoxOpacity,
          "${widget.nickName}님의 매너온도가 1°C 상승합니다",
        ),
        _renderReviewExplanation(
          20 * wu,
          _badExplanationBoxOpacity,
          "${widget.nickName}님의 매너온도가 1°C 하락합니다",
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: _duration),
          curve: _curve,
          left: _profilePosition,
          child: GestureDetector(
            onTap: () {
              log("친구 추가");
            },
            onHorizontalDragDown: (_) {
              /// 다시 드래그 시작할 때
              _duration = 10;
              _curve = Curves.linear;
            },
            onHorizontalDragStart: (_) {
              _goodExplanationBoxOpacity = 0;
              _badExplanationBoxOpacity = 0;
              setState(() {});
            },
            onHorizontalDragUpdate: (details) {
              /// 움직인 변위 값에 따라 ui 업데이트
              final move = details.primaryDelta!;

              if (move.isNegative) {
                if (_profilePosition < wu * 45) {
                  return;
                }
              } else {
                if (_profilePosition > wu * 235) {
                  return;
                }
              }
              _boxOpacity =
                  1 - ((_centerOfProfile - _profilePosition).abs() / 100);
              _profilePosition += move;
              setState(() {});
            },
            onHorizontalDragEnd: (details) {
              /// 드래그 종료 위치에 따라 프로필 포지션 변경
              final endDx = details.globalPosition.dx;

              if (endDx > wu * 230) {
                _profilePosition = _rightOfProfile;
                _boxOpacity = 0;
                _badExplanationBoxOpacity = 1;
              } else if (endDx < wu * 60) {
                _profilePosition = _leftOfProfile;
                _boxOpacity = 0;
                _goodExplanationBoxOpacity = 1;
              } else {
                _profilePosition = _centerOfProfile;
                _boxOpacity = 1;
              }
              _duration = 250;
              _curve = Curves.easeInOut;
              setState(() {});
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UserProfile(
                  profileUrl: widget.profileUrl,
                  randomAvatarSize: 40,
                ),
                Text(widget.nickName),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// 좋아요, 싫어요 박스 렌더링
AnimatedOpacity _renderReviewPoint(
  double opacity,
  int duration,
  Color color,
  IconData iconData,
  String label,
) {
  double aniOpacity = opacity;

  if (aniOpacity < 0) {
    aniOpacity = 0;
  } else if (aniOpacity > 1) {
    aniOpacity = 1;
  }

  return AnimatedOpacity(
    opacity: aniOpacity,
    duration: Duration(milliseconds: duration),
    child: Container(
      color: color,
      padding: EdgeInsets.all(16 * hu),
      width: 60 * wu,
      height: 80 * hu,
      child: FittedBox(
        child: Column(
          children: [
            Icon(
              iconData,
              color: mainWhiteSilverColor,
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: mainWhiteSilverColor,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

/// 좋아요 또는 싫어요를 선택 시 부연 설명 위젯
Positioned _renderReviewExplanation(
    double position, double opacity, String explanation) {
  return Positioned(
    left: position,
    child: AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 300),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: mainBlackColor.withOpacity(0.5),
        ),
        padding: const EdgeInsets.all(12),
        child: Text(
          explanation,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: mainWhiteSilverColor,
          ),
        ),
      ),
    ),
  );
}
