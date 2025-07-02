import 'package:sottie_flutter/model/user/my_info_model.dart';

sealed class MyInfoController {
  static final myInfoModel = MyInfoModel(
    id: 213,
    name: 'name',
    email: 'email',
    phoneNumber: 'phoneNumber',
    gender: 'gender',
    identifier: 'identifier',
    birthYear: 'birthYear',
    phoneAuthenticated: true,
  );
}
