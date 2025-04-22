import 'package:sottie_flutter/core/local_database/object_box_store.dart';
import 'package:sottie_flutter/core/local_database/objectbox.g.dart';
import 'package:sottie_flutter/model/in_chat/dto/in_chat_event_list_local_dto.dart';
import 'package:sottie_flutter/model/in_chat/entity/in_chat_event_entity.dart';
import 'package:sottie_flutter/model/user/dto/user_local_dto.dart';

final class InChatRepoLocal {
  static final InChatRepoLocal _instance = InChatRepoLocal._();

  factory InChatRepoLocal() => _instance;

  InChatRepoLocal._();

  /// 로컬 데이터 가져오기
  InChatEventListLocalDTO? getInChatEventList({required String rooId}) {
    try {
      final box = ObjectBoxStore().getBox<InChatEventListLocalDTO>();
      final query =
          box.query(InChatEventListLocalDTO_.roomId.equals(rooId)).build();
      final result = query.findUnique();
      query.close();
      return result;
    } catch (_) {
      return null;
    }
  }

  /// 로컬 데이터 저장
  bool putLocalEventData({
    required InChatEventListEntity inChatEventListEntity,
  }) {
    try {
      final box = ObjectBoxStore().getBox<InChatEventListLocalDTO>();
      final inChatEventListLocalDTO = InChatEventListLocalDTO.fromEntity(
        entity: inChatEventListEntity,
      );

      box.put(inChatEventListLocalDTO);
      return true;
    } catch (_) {
      return false;
    }
  }

  /// 로컬 데이터 삭제
  bool removeLocalEventData({required String rooId}) {
    try {
      final inChatEventListLocalDTOBox =
          ObjectBoxStore().getBox<InChatEventListLocalDTO>();
      final query =
          inChatEventListLocalDTOBox
              .query(InChatEventListLocalDTO_.roomId.equals(rooId))
              .build();
      final inChatEventListLocalDTO = query.findUnique();
      query.close();

      /// 존재할 경우
      if (inChatEventListLocalDTO != null) {
        final inChatEventLocalDTOBox =
            ObjectBoxStore().getBox<InChatEventLocalDTO>();
        final inChatDataLocalDTOBox =
            ObjectBoxStore().getBox<InChatDataLocalDTO>();
        final userLocalDTOBox = ObjectBoxStore().getBox<UserLocalDTO>();

        /// Id 수집
        final inChatDataIds = <int>[];
        final eventListIds =
            inChatEventListLocalDTO.inChatEventList.map((e) {
              inChatDataIds.add(e.inChatData.targetId);
              return e.id;
            }).toList();
        final userIds =
            inChatEventListLocalDTO.userList.map((e) => e.id).toList();

        /// 삭제하기
        inChatEventLocalDTOBox.removeMany(eventListIds);
        inChatDataLocalDTOBox.removeMany(inChatDataIds);
        userLocalDTOBox.removeMany(userIds);
        inChatEventListLocalDTOBox.remove(inChatEventListLocalDTO.id);
      }
      return true;
    } catch (_) {
      return false;
    }
  }
}
