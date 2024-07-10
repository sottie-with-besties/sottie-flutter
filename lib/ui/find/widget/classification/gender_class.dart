import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/data/classification/model/classification.dart';
import 'package:sottie_flutter/data/classification/model/gender_restrictions.dart';

class GenderClass extends StatefulWidget {
  const GenderClass({
    super.key,
    required this.classification,
  });

  final Classification classification;

  @override
  State<GenderClass> createState() => _GenderClassState();
}

class _GenderClassState extends State<GenderClass> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "성별",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _GenderButton(
                  gender: "남자",
                  classificationCallback: () {
                    switch (widget.classification.gender) {
                      case GenderRestrictions.all:
                        widget.classification.gender =
                            GenderRestrictions.womanOnly;
                        break;
                      case GenderRestrictions.manOnly:
                        widget.classification.gender =
                            GenderRestrictions.nobody;
                        break;
                      case GenderRestrictions.womanOnly:
                        widget.classification.gender = GenderRestrictions.all;
                        break;
                      case GenderRestrictions.nobody:
                        widget.classification.gender =
                            GenderRestrictions.manOnly;
                        break;
                      default:
                        widget.classification.gender = GenderRestrictions.all;
                        break;
                    }
                  },
                ),
                const SizedBox(
                  width: 50,
                ),
                _GenderButton(
                  gender: "여자",
                  classificationCallback: () {
                    switch (widget.classification.gender) {
                      case GenderRestrictions.all:
                        widget.classification.gender =
                            GenderRestrictions.manOnly;
                        break;
                      case GenderRestrictions.manOnly:
                        widget.classification.gender = GenderRestrictions.all;
                        break;
                      case GenderRestrictions.womanOnly:
                        widget.classification.gender =
                            GenderRestrictions.nobody;
                        break;
                      case GenderRestrictions.nobody:
                        widget.classification.gender =
                            GenderRestrictions.womanOnly;
                        break;
                      default:
                        widget.classification.gender = GenderRestrictions.all;
                        break;
                    }
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _GenderButton extends StatefulWidget {
  const _GenderButton({
    required this.gender,
    required this.classificationCallback,
  });

  final String gender;
  final VoidCallback classificationCallback;

  @override
  State<_GenderButton> createState() => _GenderButtonState();
}

class _GenderButtonState extends State<_GenderButton> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: isSelected
            ? null
            : ElevatedButton.styleFrom(backgroundColor: Colors.grey),
        onPressed: () {
          isSelected = !isSelected;
          widget.classificationCallback();
          setState(() {});
        },
        child: Text(
          widget.gender,
          style: const TextStyle(
            color: mainSilverColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
