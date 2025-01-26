import 'package:sottie_flutter/domain/post/entity/post_entity.dart';

Future<List<PostEntity>> getSearchPostDummy(
    Map<String, dynamic> postSetting) async {
  await Future.delayed(const Duration(seconds: 1), null);
  return [];
}
