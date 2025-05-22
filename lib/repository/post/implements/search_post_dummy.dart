import 'package:sottie_flutter/model/post/post_model.dart';

Future<List<PostModel>> getSearchPostDummy(
  Map<String, dynamic> postSetting,
) async {
  await Future.delayed(const Duration(seconds: 1), null);
  return [];
}
