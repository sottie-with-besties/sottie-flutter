import 'package:sottie_flutter/core/local_database/object_box_store.dart';
import 'package:sottie_flutter/core/local_database/objectbox.g.dart';
import 'package:sottie_flutter/model/in_chat/in_chat_event_local_model.dart';
import 'package:sottie_flutter/model/in_chat/in_chat_event_model.dart';
import 'package:sottie_flutter/model/user/user_local_model.dart';

final class InChatRepoLocal {
  static final InChatRepoLocal _instance = InChatRepoLocal._();

  factory InChatRepoLocal() => _instance;

  InChatRepoLocal._();

  /// 로컬 데이터 가져오기
  InChatEventListLocalModel? getInChatEventList({required String roomId}) {
    try {
      final box = ObjectBoxStore().getBox<InChatEventListLocalModel>();
      final query =
          box.query(InChatEventListLocalModel_.roomId.equals(roomId)).build();
      final result = query.findUnique();
      query.close();
      return result;
    } catch (_) {
      return null;
    }
  }

  /// 로컬 데이터 저장
  bool putLocalEventData({required InChatEventListModel inChatEventListModel}) {
    try {
      final box = ObjectBoxStore().getBox<InChatEventListLocalModel>();
      final inChatEventListLocalModel = InChatEventListLocalModel.fromModel(
        inChatEventListModel,
      );

      box.put(inChatEventListLocalModel);
      return true;
    } catch (_) {
      return false;
    }
  }

  /// 로컬 데이터 삭제
  bool removeLocalEventData({required String roomId}) {
    try {
      final inChatEventListLocalModelBox =
          ObjectBoxStore().getBox<InChatEventListLocalModel>();
      final query =
          inChatEventListLocalModelBox
              .query(InChatEventListLocalModel_.roomId.equals(roomId))
              .build();
      final inChatEventListLocalModel = query.findUnique();
      query.close();

      /// 존재할 경우
      if (inChatEventListLocalModel != null) {
        final inChatEventLocalDTOBox =
            ObjectBoxStore().getBox<InChatEventLocalModel>();
        final userLocalDTOBox = ObjectBoxStore().getBox<UserLocalModel>();

        /// Id 수집
        final eventListIds =
            inChatEventListLocalModel.inChatEventList.map((e) => e.id).toList();
        final userIds =
            inChatEventListLocalModel.userList.map((e) => e.id).toList();

        /// 삭제하기
        inChatEventLocalDTOBox.removeMany(eventListIds);
        userLocalDTOBox.removeMany(userIds);
        inChatEventListLocalModelBox.remove(inChatEventListLocalModel.id);
      }
      return true;
    } catch (_) {
      return false;
    }
  }
}
