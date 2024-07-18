import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';
import 'package:sottie_flutter/domain/find/classification_entity/model/classification.dart';
import 'package:sottie_flutter/domain/find/classification_entity/model/gender_restrictions.dart';
import 'package:sottie_flutter/ui/find/widget/classification/classification_title.dart';

class GenderClass extends StatelessWidget {
  const GenderClass({
    super.key,
    required this.classification,
  });

  final Classification classification;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ClassificationTitle(title: "성별"),
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
                    switch (classification.gender) {
                      case GenderRestrictions.all:
                        classification.gender = GenderRestrictions.womanOnly;
                        break;
                      case GenderRestrictions.manOnly:
                        classification.gender = GenderRestrictions.nobody;
                        break;
                      case GenderRestrictions.womanOnly:
                        classification.gender = GenderRestrictions.all;
                        break;
                      case GenderRestrictions.nobody:
                        classification.gender = GenderRestrictions.manOnly;
                        break;
                      default:
                        classification.gender = GenderRestrictions.all;
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
                    switch (classification.gender) {
                      case GenderRestrictions.all:
                        classification.gender = GenderRestrictions.manOnly;
                        break;
                      case GenderRestrictions.manOnly:
                        classification.gender = GenderRestrictions.all;
                        break;
                      case GenderRestrictions.womanOnly:
                        classification.gender = GenderRestrictions.nobody;
                        break;
                      case GenderRestrictions.nobody:
                        classification.gender = GenderRestrictions.womanOnly;
                        break;
                      default:
                        classification.gender = GenderRestrictions.all;
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
