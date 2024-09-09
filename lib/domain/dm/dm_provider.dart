import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sottie_flutter/data/dm/data_source/dm_dummy.dart';
import 'package:sottie_flutter/data/dm/model/dm_model.dart';

part 'dm_provider.g.dart';

@Riverpod(keepAlive: true)
final class DmState extends _$DmState {
  @override
  FutureOr<List<DmModel>> build() {
    return getDmDummy();
  }
}
