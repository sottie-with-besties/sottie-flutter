import 'dart:developer';

import 'package:sottie_flutter/model/more/more_event_model.dart';
import 'package:sottie_flutter/model/more/more_notice_model.dart';
import 'package:sottie_flutter/repository/more/interface/more_repository.dart';

sealed class MoreUseCase {
  static final _repo = MoreRepository();

  /// 공지사항 불러오기
  static Future<List<MoreNoticeModel>> getNoticeList() async {
    try {
      final noticeList = await _repo.getNoticeList();
      return noticeList;
    } catch (e) {
      log("Error fetching notice list: $e");
      return [];
    }
  }

  /// 이벤트 불러오기
  static Future<List<MoreEventModel>> getEventList() async {
    try {
      final eventList = await _repo.getEventList();
      return eventList;
    } catch (e) {
      log("Error fetching event list: $e");
      return [];
    }
  }

  /// 고객 센터 문의
  static Future<bool> sendCustomerCenterInquiry(String text) async {
    try {
      final result = await _repo.sendCustomerCenterInquiry(text: text);
      log("Customer center inquiry sent, result: $result");
      return result;
    } catch (e) {
      log("Error sending customer center inquiry: $e");
      return false;
    }
  }

  /// 광고 마케팅 알림 설정 변경
  static Future<bool> switchAdMarketingAlarm(bool value) async {
    try {
      final result = await _repo.switchAdMarketingAlarm(value: value);
      log("Ad marketing alarm switched to $value, result: $result");
      return result;
    } catch (e) {
      log("Error switching ad marketing alarm: $e");
      return false;
    }
  }

  /// 채팅 생성 알림 설정 변경
  static Future<bool> switchChatCreateAlarm(bool value) async {
    try {
      final result = await _repo.switchChatCreateAlarm(value: value);
      log("Chat create alarm switched to $value, result: $result");
      return result;
    } catch (e) {
      log("Error switching chat create alarm: $e");
      return false;
    }
  }

  /// 채팅 알림 설정 변경
  static Future<bool> switchChatAlarm(bool value) async {
    try {
      final result = await _repo.switchChatAlarm(value: value);
      log("Chat alarm switched to $value, result: $result");
      return result;
    } catch (e) {
      log("Error switching chat alarm: $e");
      return false;
    }
  }

  /// DM 알림 설정 변경
  static Future<bool> switchDmAlarm(bool value) async {
    try {
      final result = await _repo.switchDmAlarm(value: value);
      log("DM alarm switched to $value, result: $result");
      return result;
    } catch (e) {
      log("Error switching DM alarm: $e");
      return false;
    }
  }

  /// 친구 추가 거부 설정 변경
  static Future<bool> switchFriendAddReject(bool value) async {
    try {
      final result = await _repo.switchFriendAddReject(value: value);
      log("Friend add reject switched to $value, result: $result");
      return result;
    } catch (e) {
      log("Error switching friend add reject: $e");
      return false;
    }
  }
}
