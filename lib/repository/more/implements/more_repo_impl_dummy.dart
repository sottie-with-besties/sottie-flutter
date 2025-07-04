import 'package:sottie_flutter/model/more/more_event_model.dart';
import 'package:sottie_flutter/model/more/more_notice_model.dart';
import 'package:sottie_flutter/repository/more/interface/more_repository.dart';

final class MoreRepoImplDummy implements MoreRepository {
  @override
  Future<List<MoreEventModel>> getEventList() async {
    await Future.delayed(const Duration(milliseconds: 500), null);
    return [
      MoreEventModel(
        eventTitle: '[더미] 소띠 출시 기념 이벤트',
        eventContents:
            '소띠 앱 출시를 기념하여 특별 이벤트를 진행합니다. 참여하시는 모든 분께 소띠 포인트 1,000점을 드립니다.',
        eventDateStart: DateTime.now().subtract(const Duration(days: 5)),
        eventDateEnd: DateTime.now().add(const Duration(days: 10)),
        eventImageUrl: 'https://picsum.photos/seed/event1/500/300',
      ),
      MoreEventModel(
        eventTitle: '[더미] 여름 맞이 친구 추천 이벤트',
        eventContents:
            '친구를 추천하고 특별 혜택을 받아가세요. 추천된 친구가 가입시 두 분 모두에게 소띠 포인트 500점을 드립니다.',
        eventDateStart: DateTime.now().subtract(const Duration(days: 10)),
        eventDateEnd: DateTime.now().add(const Duration(days: 20)),
        eventImageUrl: 'https://picsum.photos/seed/event2/500/300',
      ),
      MoreEventModel(
        eventTitle: '[더미] 소띠 앱 업데이트 안내',
        eventContents: '소띠 앱이 새롭게 업데이트 되었습니다. 개선된 기능을 확인해보세요.',
        eventDateStart: DateTime.now().subtract(const Duration(days: 2)),
        eventDateEnd: DateTime.now().add(const Duration(days: 30)),
        eventImageUrl: 'https://picsum.photos/seed/event3/500/300',
      ),
      MoreEventModel(
        eventTitle: '[더미] 소띠 사용자 설문조사 이벤트',
        eventContents: '더 나은 서비스를 위한 설문조사에 참여해주시면 추첨을 통해 기프티콘을 드립니다.',
        eventDateStart: DateTime.now().subtract(const Duration(days: 15)),
        eventDateEnd: DateTime.now().add(const Duration(days: 5)),
        eventImageUrl: 'https://picsum.photos/seed/event4/500/300',
      ),
    ];
  }

  @override
  Future<List<MoreNoticeModel>> getNoticeList() async {
    await Future.delayed(const Duration(milliseconds: 500), null);
    return [
      MoreNoticeModel(
        noticeTitle: '[더미] 서비스 점검 안내',
        noticeContents:
            '8월 15일 새벽 2시부터 4시까지 서비스 점검이 예정되어 있습니다. 해당 시간에는 서비스 이용이 제한될 수 있습니다.',
        noticeDate: DateTime.now().subtract(const Duration(days: 2)),
      ),
      MoreNoticeModel(
        noticeTitle: '[더미] 개인정보 처리방침 변경 안내',
        noticeContents: '2023년 9월 1일부로 개인정보 처리방침이 변경됩니다. 자세한 내용은 공지사항을 참고해주세요.',
        noticeDate: DateTime.now().subtract(const Duration(days: 7)),
      ),
      MoreNoticeModel(
        noticeTitle: '[더미] 소띠 앱 신규 기능 안내',
        noticeContents: '소띠 앱에 채팅 기능이 추가되었습니다. 친구들과 실시간으로 대화를 나눠보세요.',
        noticeDate: DateTime.now().subtract(const Duration(days: 14)),
      ),
      MoreNoticeModel(
        noticeTitle: '[더미] 회원가입 방법 안내',
        noticeContents: '소띠 앱 회원가입 방법이 간소화되었습니다. 카카오, 구글, 애플 계정으로 빠르게 가입하세요.',
        noticeDate: DateTime.now().subtract(const Duration(days: 21)),
      ),
      MoreNoticeModel(
        noticeTitle: '[더미] 고객센터 운영시간 변경',
        noticeContents:
            '고객센터 운영시간이 평일 9시부터 18시까지로 변경되었습니다. 문의사항은 운영시간 내에 연락 부탁드립니다.',
        noticeDate: DateTime.now().subtract(const Duration(days: 30)),
      ),
    ];
  }

  @override
  Future<bool> sendCustomerCenterInquiry({required String text}) async {
    await Future.delayed(const Duration(milliseconds: 700), null);
    return true;
  }

  @override
  Future<bool> switchAdMarketingAlarm({required bool value}) async {
    await Future.delayed(const Duration(milliseconds: 300), null);
    return true;
  }

  @override
  Future<bool> switchChatAlarm({required bool value}) async {
    await Future.delayed(const Duration(milliseconds: 300), null);
    return true;
  }

  @override
  Future<bool> switchChatCreateAlarm({required bool value}) async {
    await Future.delayed(const Duration(milliseconds: 300), null);
    return true;
  }

  @override
  Future<bool> switchDmAlarm({required bool value}) async {
    await Future.delayed(const Duration(milliseconds: 300), null);
    return true;
  }

  @override
  Future<bool> switchFriendAddReject({required bool value}) async {
    await Future.delayed(const Duration(milliseconds: 300), null);
    return true;
  }
}
