import 'package:get_it/get_it.dart' show GetIt;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sottie_flutter/model/chat/entity/dm_entity.dart';
import 'package:sottie_flutter/use_case/chat/chat_use_case.dart';

part 'dm_provider.g.dart';

@Riverpod(keepAlive: true)
final class DmState extends _$DmState {
  @override
  FutureOr<List<DmEntity>> build() {
    final useCase = GetIt.I.get<ChatUseCase>();
    return useCase.getDmList();
  }
}
