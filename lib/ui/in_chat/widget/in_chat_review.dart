import 'dart:async';
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
    this.guideArrowOn = false,
  });

  final String profileUrl;
  final String nickName;
  final bool guideArrowOn;

  @override
  State<InChatReview> createState() => _InChatReviewState();
}

class _InChatReviewState extends State<InChatReview> {
  /// 프로필 중앙 위치
  final _centerOfProfile = 135 * wu;

  /// 프로필 좋아요 위치
  final _leftOfProfile = 20 * wu;

  /// 프로필 싫어요 위치
  final _rightOfProfile = 250 * wu;

  /// 업데이트 중일땐 애니메이션이 빠르게, 끝날땐 느리게 변함
  /// onHorizontalDragUpdate => 10, Curves.linear
  /// onHorizontalDragEnd => 250, Curves.easeInOut
  int _duration = 10;
  Curve _curve = Curves.linear;

  /// 좋아요, 싫어요 박스 투명도 => 프로필이 중앙에서 멀어질수록 점점 어두워짐
  double _boxOpacity = 1;

  /// 좋아요 또는 싫어요에 프로필을 옮겼을 때, 부연 설명 컨테이너의 투명도를 1로 바꾸어 나타나게함
  double _goodExplanationBoxOpacity = 0;
  double _badExplanationBoxOpacity = 0;

  /// 가이드 화살표 투명도
  double _guideArrowOpacity = 1;

  /// 프로필의 처음 위치 == _centerOfProfile
  double _profilePosition = 135 * wu;

  /// 프로필의 위치에 따른 컨테이너 그라디언트
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

  /// 프로필의 위치에 따른 stop value
  List<double> _renderStops() {
    /// 값 조정
    double stop = 1 / _profilePosition * 50 + 0.25;

    /// 좋아요
    if (_profilePosition == _leftOfProfile) {
      return <double>[
        0,
        0.99,
      ];
    }

    /// 싫어요
    else if (_profilePosition == _rightOfProfile) {
      return <double>[
        0.01,
        1,
      ];
    }

    /// 좋아요 < 중간
    else if (_profilePosition < _centerOfProfile) {
      if (stop > 0.99) {
        stop = 0.99;
      }
      return <double>[
        0,
        stop,
      ];
    }

    /// 중간 < 싫어요
    else if (_profilePosition > _centerOfProfile) {
      if (stop < 0.01) {
        stop = 0.01;
      }
      return <double>[
        stop - 0.2, // 값이 부족하여 -0.2 만큼 추가
        1,
      ];
    }

    /// 중간
    else {
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
        if (widget.guideArrowOn) ...[
          _GuideArrow(
            iconData: Icons.keyboard_arrow_left,
            position: _centerOfProfile - (65 * wu),
            opacity: _guideArrowOpacity,
          ),
          _GuideArrow(
            iconData: Icons.keyboard_arrow_right,
            position: _centerOfProfile + (50 * wu),
            opacity: _guideArrowOpacity,
          ),
        ],
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
              /// 좋아요 또는 싫어요 위치에서 드래그 시작시 부연 설명 투명도 안보이게 하기
              _goodExplanationBoxOpacity = 0;
              _badExplanationBoxOpacity = 0;
              _guideArrowOpacity = 0;
              setState(() {});
            },
            onHorizontalDragUpdate: (details) {
              /// 움직인 변위 값에 따라 ui 업데이트
              final move = details.primaryDelta!;

              /// 일정 변위 만큼 움직이면 더이상 움직일 수 없게 한 후 좋아요 또는 싫어요 선택
              if (move.isNegative) {
                if (_profilePosition < wu * 45) {
                  return;
                }
              } else {
                if (_profilePosition > wu * 235) {
                  return;
                }
              }

              /// 투명도 조정
              _boxOpacity =
                  1 - ((_centerOfProfile - _profilePosition).abs() / 100);
              _profilePosition += move;
              setState(() {});
            },
            onHorizontalDragEnd: (details) {
              /// 드래그 종료 위치에 따라 프로필 포지션 변경
              final endDx = details.globalPosition.dx;

              /// 싫어요
              if (endDx > wu * 230) {
                _profilePosition = _rightOfProfile;
                _boxOpacity = 0;
                _badExplanationBoxOpacity = 1;
              }

              /// 좋아요
              else if (endDx < wu * 60) {
                _profilePosition = _leftOfProfile;
                _boxOpacity = 0;
                _goodExplanationBoxOpacity = 1;
              }

              /// 보통
              else {
                _profilePosition = _centerOfProfile;
                _boxOpacity = 1;
                _guideArrowOpacity = 1;
              }

              /// 끝날땐 애니메이션 천천히 보여주기
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

/// 좋아요 또는 싫어요 선택 유도 화살표
class _GuideArrow extends StatefulWidget {
  const _GuideArrow({
    required this.iconData,
    required this.position,
    required this.opacity,
  });

  final IconData iconData;
  final double position;
  final double opacity;

  @override
  State<_GuideArrow> createState() => _GuideArrowState();
}

class _GuideArrowState extends State<_GuideArrow> {
  final List<bool> _lightOn = <bool>[false, false, false];
  int _lightIndex = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();

    /// 아이콘에 따른 불 켜지는 순서 변경
    if (widget.iconData == Icons.keyboard_arrow_left) {
      _lightIndex = 2;
      _lightOn[2] = true;
    } else {
      _lightIndex = 0;
      _lightOn[0] = true;
    }

    timer = Timer.periodic(
      const Duration(milliseconds: 500),
      (timer) {
        if (widget.iconData == Icons.keyboard_arrow_left) {
          _lightOn[_lightIndex] = false;
          _lightIndex == 0 ? _lightIndex = 2 : _lightIndex--;
          _lightOn[_lightIndex] = true;
        } else {
          _lightOn[_lightIndex] = false;
          _lightIndex == 2 ? _lightIndex = 0 : _lightIndex++;
          _lightOn[_lightIndex] = true;
        }
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.position,
      child: AnimatedOpacity(
        opacity: widget.opacity,
        duration: const Duration(milliseconds: 300),
        child: Row(
          children: _lightOn.map<Widget>((light) {
            return Icon(
              widget.iconData,
              color: light ? mainBlueColor : mainGreyColor,
            );
          }).toList(),
        ),
      ),
    );
  }
}
