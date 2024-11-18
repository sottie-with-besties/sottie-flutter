import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:sottie_flutter/domain/post/post_setting_entity.dart';

Future<void> searchPost(BuildContext context) async {
  context.pop();
  final searchFilteringData = postSettingEntity.toJsonForSearchFiltering();
}
