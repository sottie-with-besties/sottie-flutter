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
        entity: [
          InChatMessageDataEntityModel(
            entity: '안녕하세요.',
            entityType: 'string',
          ),
        ],
      ),
      InChatMessageDataModel(
        id: '2',
        userIdWhoSent: '54321',
        sentTime: '2024-09-14T08:01:00Z',
        entity: [
          InChatMessageDataEntityModel(
            entity: '반갑습니다.',
            entityType: 'string',
          ),
          InChatMessageDataEntityModel(
            entity: '성함이 어떻게 되세요?',
            entityType: 'string',
          ),
        ],
      ),
      InChatMessageDataModel(
        id: '3',
        userIdWhoSent: '12345',
        sentTime: '2024-09-14T08:02:00Z',
        entity: [
          InChatMessageDataEntityModel(
            entity: '저는 김철수입니다.',
            entityType: 'string',
          ),
        ],
      ),
      InChatMessageDataModel(
        id: '4',
        userIdWhoSent: '54321',
        sentTime: '2024-09-14T08:03:00Z',
        entity: [
          InChatMessageDataEntityModel(
            entity: '아, 그렇군요.',
            entityType: 'string',
          ),
          InChatMessageDataEntityModel(
            entity: '잘 부탁드립니다.',
            entityType: 'string',
          ),
          InChatMessageDataEntityModel(
            entity: '수원에서 만나기로 한 거죠?',
            entityType: 'string',
          ),
        ],
      ),
      InChatMessageDataModel(
        id: '5',
        userIdWhoSent: '12345',
        sentTime: '2024-09-14T08:05:00Z',
        entity: [
          InChatMessageDataEntityModel(
            entity: '네, 맞습니다.',
            entityType: 'string',
          ),
        ],
      ),
      InChatMessageDataModel(
        id: '6',
        userIdWhoSent: '54321',
        sentTime: '2024-09-14T08:06:00Z',
        entity: [
          InChatMessageDataEntityModel(
            entity: '시간은 3시 어떠세요?',
            entityType: 'string',
          ),
        ],
      ),
      InChatMessageDataModel(
        id: '7',
        userIdWhoSent: '12345',
        sentTime: '2024-09-14T08:07:00Z',
        entity: [
          InChatMessageDataEntityModel(
            entity: '네, 3시에 뵙겠습니다.',
            entityType: 'string',
          ),
        ],
      ),
      InChatMessageDataModel(
        id: '8',
        userIdWhoSent: '54321',
        sentTime: '2024-09-14T08:08:00Z',
        entity: [
          InChatMessageDataEntityModel(
            entity: '좋습니다. 그럼 수원역에서 봬요.',
            entityType: 'string',
          ),
        ],
      ),
      InChatMessageDataModel(
        id: '9',
        userIdWhoSent: '12345',
        sentTime: '2024-09-14T08:09:00Z',
        entity: [
          InChatMessageDataEntityModel(
            entity: '네, 수원역에서 뵐게요.',
            entityType: 'string',
          ),
        ],
      ),
      InChatMessageDataModel(
        id: '10',
        userIdWhoSent: '54321',
        sentTime: '2024-09-14T08:10:00Z',
        entity: [
          InChatMessageDataEntityModel(
            entity: '그럼 그때 뵙겠습니다.',
            entityType: 'string',
          ),
        ],
      ),
      InChatMessageDataModel(
        id: '11',
        userIdWhoSent: '12345',
        sentTime: '2024-09-14T08:11:00Z',
        entity: [
          InChatMessageDataEntityModel(
            entity: '네, 좋은 하루 보내세요.',
            entityType: 'string',
          ),
        ],
      ),
      InChatMessageDataModel(
        id: '12',
        userIdWhoSent: '54321',
        sentTime: '2024-09-14T08:12:00Z',
        entity: [
          InChatMessageDataEntityModel(
            entity: '감사합니다. 좋은 하루 되세요.',
            entityType: 'string',
          ),
        ],
      ),
    ],
  );
}
