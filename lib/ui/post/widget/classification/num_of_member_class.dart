import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sottie_flutter/domain/post/make_post_detail_entity.dart';
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
  dynamic initValue = 0;

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
    makePostDetailEntity.numOfMember = num;
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
      initValue = makePostDetailEntity.numOfMember;
      if (makePostDetailEntity.numOfMember > 10) {
        controller.text = makePostDetailEntity.numOfMember.toString();
      }
      ref
          .read(numOfMemberProvider.notifier)
          .changeNumOfMember(makePostDetailEntity.numOfMember);
      setState(() {});
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
      initialSelection: initValue,
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
          makePostDetailEntity.numOfMember = int.parse(val.toString());
          ref
              .read(numOfMemberProvider.notifier)
              .changeNumOfMember(makePostDetailEntity.numOfMember);
        }
      },
    );
  }
}
