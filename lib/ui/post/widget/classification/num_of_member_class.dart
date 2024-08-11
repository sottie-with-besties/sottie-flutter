import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sottie_flutter/domain/post/post_setting_entity.dart';
import 'package:sottie_flutter/ui/post/controller/num_of_member.dart';
import 'package:sottie_flutter/ui/post/widget/classification/classification_title.dart';

class NumOfMemberClass extends StatelessWidget {
  const NumOfMemberClass({
    super.key,
    required this.focusNode,
  });

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ClassificationTitle(title: "인원 수"),
        const SizedBox(width: 20),
        _NumOfMemberSelector(focusNode: focusNode),
      ],
    );
  }
}

class _NumOfMemberSelector extends ConsumerStatefulWidget {
  const _NumOfMemberSelector({
    required this.focusNode,
  });

  final FocusNode focusNode;

  @override
  ConsumerState<_NumOfMemberSelector> createState() =>
      _NumOfMemberSelectorState();
}

class _NumOfMemberSelectorState extends ConsumerState<_NumOfMemberSelector> {
  final entries = List.generate(12, (index) {
    if (index == 0) {
      return "제한 없음";
    } else if (index == 11) {
      return "직접 입력";
    } else {
      return index;
    }
  });

  String focusVal = '';

  final controller = TextEditingController();

  void _focusNodeListener() {
    if (focusVal != '직접 입력') {
      widget.focusNode.unfocus();
    }
  }

  void _controllerListener() {
    int num = 0;
    if (controller.text == "제한 없음" ||
        controller.text == "직접 입력" ||
        controller.text == "") {
      num = 0;
    } else {
      num = int.parse(controller.text);
      // 사용자가 직접입력에 숫자를 int의 max값 보다 크게 넣으면 에러가 발생. 1000000을 최댓값으로 설정
      if (num > 1000000) {
        num = 1000000;
        controller.text = num.toString();
      }
    }

    postSettingEntity.numOfMember = num;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(numOfMemberProvider.notifier).changeNumOfMember(num);
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.focusNode.addListener(_focusNodeListener);
      controller.addListener(_controllerListener);

      // 검색 스크린에서 필터링 시 데이터 유지
      if (postSettingEntity.numOfMember > 10) {
        controller.text = postSettingEntity.numOfMember.toString();
      }
      ref
          .read(numOfMemberProvider.notifier)
          .changeNumOfMember(postSettingEntity.numOfMember);
    });
  }

  @override
  void dispose() {
    controller.removeListener(_controllerListener);
    widget.focusNode.removeListener(_focusNodeListener);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      initialSelection: postSettingEntity.numOfMember,
      menuHeight: 200,
      controller: controller,
      focusNode: widget.focusNode,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      dropdownMenuEntries: entries
          .map((val) => DropdownMenuEntry(
              value: val == "제한 없음" ? 0 : val, label: val.toString()))
          .toList(),
      onSelected: (val) {
        focusVal = val.toString();
        if (val == "직접 입력") {
          controller.clear();
          widget.focusNode.requestFocus();
        } else {
          widget.focusNode.unfocus();
          try {
            postSettingEntity.numOfMember = int.parse(val.toString());
          } on Exception catch (_) {
            // 인원 수를 고른 후 키보드의 Done 버튼을 누를 경우의 에러 처리
            // 리스너에서 이미 값을 처리하고 있기 때문에 그냥 패스하면 될듯?
          }
          ref
              .read(numOfMemberProvider.notifier)
              .changeNumOfMember(postSettingEntity.numOfMember);
        }
      },
    );
  }
}
