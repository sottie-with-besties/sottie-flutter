import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sottie_flutter/model/chat/dm_model.dart';
import 'package:sottie_flutter/use_case/chat/chat_use_case.dart';

part 'dm_provider.g.dart';

@Riverpod(keepAlive: true)
final class DmState extends _$DmState {
  @override
  FutureOr<List<DmModel>> build() {
    return ChatUseCase.getDmList();
  }
}
