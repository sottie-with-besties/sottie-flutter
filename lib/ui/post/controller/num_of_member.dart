import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'num_of_member.g.dart';

// NumOfMemberClass와 GenderClass의 상호작용을 위한 리버팟
@Riverpod()
final class NumOfMember extends _$NumOfMember {
  @override
  int build() {
    return 0;
  }

  void changeNumOfMember(int numOfMember) {
    state = numOfMember;
  }
}
