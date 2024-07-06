import 'package:sottie_flutter/data/dm/data_source/dm_dummy.dart';
import 'package:sottie_flutter/data/dm/model/dm_model.dart';

final class DmProvider {
  Future<List<DmModel>> getDm() async {
    final dm = await getDmDummy();
    return dm;
  }
}
