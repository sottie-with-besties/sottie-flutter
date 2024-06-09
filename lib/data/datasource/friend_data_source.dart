import 'dart:convert';
import 'dart:math';

import 'package:sottie_with_besties/core/utils/api_util.dart';
import 'package:sottie_with_besties/data/model/friend_model.dart';

import 'package:http/http.dart' as http;

class FriendDataSource {
  Future<List<Friend>?> friend(Friend friend) async {
    print("friendDataSource ::: $friend");
    final response = await http.get(
        Uri.parse("${ApiUtil.BASE_URL}/sottie/friends/${friend.userId}"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });

    if (response.statusCode != 200) {
      throw Exception("Failed to send data");
    }

    if(response.statusCode == 200) {
      final Iterable data = jsonDecode(response.body);
      return List<Friend>.from(data.map((model) => Friend.fromJson(model)));
    }

    return null;
  }
}
