import 'package:sottie_flutter/core/rest_api/api_env.dart';
import 'package:sottie_flutter/model/more/more_event_model.dart';
import 'package:sottie_flutter/model/more/more_notice_model.dart';
import 'package:sottie_flutter/repository/more/implements/more_repo_impl_dev.dart';
import 'package:sottie_flutter/repository/more/implements/more_repo_impl_dummy.dart';

abstract interface class MoreRepository {
  factory MoreRepository() {
    return switch (ApiEnv.serverEnvironment) {
      ServerEnvironment.dummy => MoreRepoImplDummy(),
      ServerEnvironment.dev => MoreRepoImplDev(),
      _ => throw UnimplementedError(),
    };
  }

  /// 공지사항 불러오기
  Future<List<MoreNoticeModel>> getNoticeList();

  /// 이벤트 불러오기
  Future<List<MoreEventModel>> getEventList();

  /// 고객 센터 문의
  Future<bool> sendCustomerCenterInquiry({required String text});

  /// 광고 마케팅 알림
  Future<bool> switchAdMarketingAlarm({required bool value});

  /// 채팅 생성 알림
  Future<bool> switchChatCreateAlarm({required bool value});

  /// 채팅 알림
  Future<bool> switchChatAlarm({required bool value});

  /// DM 알림
  Future<bool> switchDmAlarm({required bool value});

  /// 친구 추가 거부
  Future<bool> switchFriendAddReject({required bool value});
}
