import 'dart:developer';

import 'package:sottie_flutter/model/chat/chat_room_model.dart';
import 'package:sottie_flutter/model/chat/dm_model.dart';
import 'package:sottie_flutter/model/post/post_model.dart';
import 'package:sottie_flutter/repository/chat/interface/chat_repository.dart';

sealed class ChatUseCase {
  static final _repo = ChatRepository();

  // 채팅방 가져오기
  static Future<List<ChatRoomModel>> getChatRoomList() async {
    try {
      final chatRoomModelList = await _repo.getChatRoomList();
      return chatRoomModelList;
    } catch (e) {
      log("Error fetching chat room list: $e");
      return [];
    }
  }

  // 채팅 대기방 가져오기
  static Future<List<PostModel>> getChatRoomWaitingList() async {
    try {
      final chatRoomWaitingList = await _repo.getChatRoomWaitingList();
      return chatRoomWaitingList;
    } catch (e) {
      log("Error fetching chat room waiting list: $e");
      return [];
    }
  }

  // Dm 가져오기
  static Future<List<DmModel>> getDmList() async {
    try {
      final dmModelList = await _repo.getDmList();
      return dmModelList;
    } catch (e) {
      log("Error fetching DM list: $e");
      return [];
    }
  }

  // 채팅방 나가기
  static Future<bool> exitChatRoom(String chatRoomId) async {
    try {
      await _repo.exitChatRoom(chatRoomId: chatRoomId);
      log("Exited chat room: $chatRoomId");
      return true;
    } catch (e) {
      log("Error exiting chat room: $e");
      return false;
    }
  }
}
