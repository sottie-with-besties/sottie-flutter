import 'package:sottie_flutter/core/local_database/object_box_store.dart';
import 'package:sottie_flutter/core/local_database/objectbox.g.dart';
import 'package:sottie_flutter/model/in_chat/in_chat_event_local_model.dart';
import 'package:sottie_flutter/model/in_chat/in_chat_event_model.dart';
import 'package:sottie_flutter/model/user/user_local_model.dart';

final class InChatRepoLocal {
  // 로컬 데이터 가져오기
  InChatEventListModel? getInChatEventList({required String roomId}) {
    try {
      final box = ObjectBoxStore().getBox<InChatEventListLocalModel>();
      final query =
          box.query(InChatEventListLocalModel_.roomId.equals(roomId)).build();
      final result = query.findUnique();
      query.close();

      final inChatEventListModel = result?.toModel();
      return inChatEventListModel;
    } catch (_) {
      return null;
    }
  }

  // 로컬 데이터 저장
  bool putLocalEventData({required InChatEventListModel inChatEventListModel}) {
    try {
      // 박스 가져오기
      final box = ObjectBoxStore().getBox<InChatEventListLocalModel>();

      // 로컬 모델 변환
      final inChatEventListLocalModel = InChatEventListLocalModel.fromModel(
        inChatEventListModel,
      );

      // 저장
      box.put(inChatEventListLocalModel);

      return true;
    } catch (_) {
      return false;
    }
  }

  // 로컬 데이터 삭제
  bool removeLocalEventData({required String roomId}) {
    try {
      // 박스 가져오기
      final inChatEventListLocalModelBox =
          ObjectBoxStore().getBox<InChatEventListLocalModel>();

      // 쿼리 생성
      final query =
          inChatEventListLocalModelBox
              .query(InChatEventListLocalModel_.roomId.equals(roomId))
              .build();

      // findUnique 검색
      final inChatEventListLocalModel = query.findUnique();

      // 쿼리 종료
      query.close();

      // roomId에 해당하는 모델이 존재할 경우
      if (inChatEventListLocalModel != null) {
        // ObjectBox의 경우 관계된 데이터까지 자동으로 삭제 되지 않기 때문에 모두 찾아서 삭제해주어야 한다
        // InChatEventLocalModel, UserLocalModel 박스 각각 가져오기
        final inChatEventLocalDTOBox =
            ObjectBoxStore().getBox<InChatEventLocalModel>();
        final userLocalDTOBox = ObjectBoxStore().getBox<UserLocalModel>();

        // Id 수집
        final eventListIds =
            inChatEventListLocalModel.inChatEventList.map((e) => e.id).toList();
        final userIds =
            inChatEventListLocalModel.userList.map((e) => e.id).toList();

        // 삭제하기
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
