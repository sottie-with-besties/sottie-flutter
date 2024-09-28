import 'package:sottie_flutter/data/in_chat/model/in_chat_message_model.dart';

Future<InChatMessageModel> getInChatMessageDummy() async {
  await Future.delayed(const Duration(seconds: 1), null);
  return InChatMessageModel(
    id: '0',
    inChatMessageData: [
      InChatMessageDataModel(
        id: '1',
        userIdWhoSent: '12345',
        sentTime: '2024-09-14T08:00:00Z',
        entity: InChatMessageDataEntityModel(
          entity: '안녕하세요.',
          entityType: 'string',
        ),
      ),
      InChatMessageDataModel(
        id: '2',
        userIdWhoSent: '54321',
        sentTime: '2024-09-14T08:01:00Z',
        entity: InChatMessageDataEntityModel(
          entity: '반갑습니다.',
          entityType: 'string',
        ),
      ),
      InChatMessageDataModel(
        id: '3',
        userIdWhoSent: '12345',
        sentTime: '2024-09-14T08:02:00Z',
        entity: InChatMessageDataEntityModel(
          entity: '오늘 날씨가 좋네요.',
          entityType: 'string',
        ),
      ),
      InChatMessageDataModel(
        id: '4',
        userIdWhoSent: '54321',
        sentTime: '2024-09-14T08:03:00Z',
        entity: InChatMessageDataEntityModel(
          entity: '네, 정말 좋아요.',
          entityType: 'string',
        ),
      ),
      InChatMessageDataModel(
        id: '5',
        userIdWhoSent: '12345',
        sentTime: '2024-09-14T08:04:00Z',
        entity: InChatMessageDataEntityModel(
          entity: '주말 계획 있으세요?',
          entityType: 'string',
        ),
      ),
      InChatMessageDataModel(
        id: '6',
        userIdWhoSent: '54321',
        sentTime: '2024-09-14T08:05:00Z',
        entity: InChatMessageDataEntityModel(
          entity: '아직 특별한 계획은 없어요.',
          entityType: 'string',
        ),
      ),
      InChatMessageDataModel(
        id: '7',
        userIdWhoSent: '54321',
        sentTime: '2024-09-14T08:05:00Z',
        entity: InChatMessageDataEntityModel(
          entity: '영화 보러 가실래요?',
          entityType: 'string',
        ),
      ),
      InChatMessageDataModel(
        id: '8',
        userIdWhoSent: '12345',
        sentTime: '2024-09-14T08:07:00Z',
        entity: InChatMessageDataEntityModel(
          entity: '좋아요, 무슨 영화 볼까요?',
          entityType: 'string',
        ),
      ),
      InChatMessageDataModel(
        id: '9',
        userIdWhoSent: '54321',
        sentTime: '2024-09-14T08:08:00Z',
        entity: InChatMessageDataEntityModel(
          entity: '액션 영화 어때요?',
          entityType: 'string',
        ),
      ),
      InChatMessageDataModel(
        id: '10',
        userIdWhoSent: '12345',
        sentTime: '2024-09-14T08:09:00Z',
        entity: InChatMessageDataEntityModel(
          entity: '좋아요, 기대되네요.',
          entityType: 'string',
        ),
      ),
      InChatMessageDataModel(
        id: '11',
        userIdWhoSent: '54321',
        sentTime: '2024-09-14T08:12:00Z',
        entity: InChatMessageDataEntityModel(
          entity: '그럼 주말에 봐요!',
          entityType: 'string',
        ),
      ),
      InChatMessageDataModel(
        id: '12',
        userIdWhoSent: '12345',
        sentTime: '2024-09-14T08:14:00Z',
        entity: InChatMessageDataEntityModel(
          entity:
              '네, 기대하고 있을게요!\n네, 기대하고 있을게요!\n네, 기대하고 있을게요!\n네, 기대하고 있을게요!\n네, 기대하고 있을게요!\n네, 기대하고 있을게요!\n네, 기대하고 있을게요!\n네, 기대하고 있을게요!\n네, 기대하고 있을게요!\n네, 기대하고 있을게요!\n네, 기대하고 있을게요!\n네, 기대하고 있을게요!\n네, 기대하고 있을게요!\n네, 기대하고 있을게요!\n네, 기대하고 있을게요!\n네, 기대하고 있을게요!\n네, 기대하고 있을게요!\n네, 기대하고 있을게요!\n네, 기대하고 있을게요!\n네, 기대하고 있을게요!\n네, 기대하고 있을게요!\n네, 기대하고 asdasdasdasdasdasdasdas 있을게요!\n네, 기대하고 있을게요!\n네, 기대하고 있을게요!\n네, 기대하고 있을게요!\n네, 기대하고 있을게요!\n네, 기대하고 있을게요!\n',
          entityType: 'string',
        ),
      ),
    ],
  );
}
