import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sottie_flutter/data/chat/model/dm_model.dart';
import 'package:sottie_flutter/data/chat/repository_impl/dm_dummy.dart';

part 'dm_provider.g.dart';

@Riverpod(keepAlive: true)
final class DmState extends _$DmState {
  @override
  FutureOr<List<DmModel>> build() {
    return getDmDummy();
  }
}
