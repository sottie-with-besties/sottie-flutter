import 'dart:convert';

import 'package:sottie_flutter/core/rest_api/api_env.dart';
import 'package:sottie_flutter/model/more/more_event_model.dart';
import 'package:sottie_flutter/model/more/more_notice_model.dart';
import 'package:sottie_flutter/repository/more/interface/more_repository.dart';

final class MoreRepoImplDev implements MoreRepository {
  @override
  Future<List<MoreEventModel>> getEventList() async {
    final uri = Uri(
      scheme: ApiEnv.scheme,
      host: ApiEnv.devHost,
      port: ApiEnv.devPort,
      path: "/more/event",
    );

    final response = await ApiEnv().cleanClient.get(uri);

    final List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>;

    return jsonList
        .map((json) => MoreEventModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<MoreNoticeModel>> getNoticeList() async {
    final uri = Uri(
      scheme: ApiEnv.scheme,
      host: ApiEnv.devHost,
      port: ApiEnv.devPort,
      path: "/more/notice",
    );

    final response = await ApiEnv().cleanClient.get(uri);

    final List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>;

    return jsonList
        .map((json) => MoreNoticeModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> sendCustomerCenterInquiry({required String text}) async {
    final uri = Uri(
      scheme: ApiEnv.scheme,
      host: ApiEnv.devHost,
      port: ApiEnv.devPort,
      path: "/more/inquiry",
    );

    final headers = {'Content-Type': 'application/json'};

    await ApiEnv().cleanClient.post(
      uri,
      headers: headers,
      body: jsonEncode({'text': text}),
    );
  }

  @override
  Future<void> switchAdMarketingAlarm({required bool value}) async {
    final uri = Uri(
      scheme: ApiEnv.scheme,
      host: ApiEnv.devHost,
      port: ApiEnv.devPort,
      path: "/more/alarm/marketing",
    );

    final headers = {'Content-Type': 'application/json'};

    await ApiEnv().cleanClient.post(
      uri,
      headers: headers,
      body: jsonEncode({'value': value}),
    );
  }

  @override
  Future<void> switchChatAlarm({required bool value}) async {
    final uri = Uri(
      scheme: ApiEnv.scheme,
      host: ApiEnv.devHost,
      port: ApiEnv.devPort,
      path: "/more/alarm/chat",
    );

    final headers = {'Content-Type': 'application/json'};

    await ApiEnv().cleanClient.post(
      uri,
      headers: headers,
      body: jsonEncode({'value': value}),
    );
  }

  @override
  Future<void> switchChatCreateAlarm({required bool value}) async {
    final uri = Uri(
      scheme: ApiEnv.scheme,
      host: ApiEnv.devHost,
      port: ApiEnv.devPort,
      path: "/more/alarm/chatcreate",
    );

    final headers = {'Content-Type': 'application/json'};

    await ApiEnv().cleanClient.post(
      uri,
      headers: headers,
      body: jsonEncode({'value': value}),
    );
  }

  @override
  Future<void> switchDmAlarm({required bool value}) async {
    final uri = Uri(
      scheme: ApiEnv.scheme,
      host: ApiEnv.devHost,
      port: ApiEnv.devPort,
      path: "/more/alarm/dm",
    );

    final headers = {'Content-Type': 'application/json'};

    await ApiEnv().cleanClient.post(
      uri,
      headers: headers,
      body: jsonEncode({'value': value}),
    );
  }

  @override
  Future<void> switchFriendAddReject({required bool value}) async {
    final uri = Uri(
      scheme: ApiEnv.scheme,
      host: ApiEnv.devHost,
      port: ApiEnv.devPort,
      path: "/more/friend/reject",
    );

    final headers = {'Content-Type': 'application/json'};

    await ApiEnv().cleanClient.post(
      uri,
      headers: headers,
      body: jsonEncode({'value': value}),
    );
  }
}
