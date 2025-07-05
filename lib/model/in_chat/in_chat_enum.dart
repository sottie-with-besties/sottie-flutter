// ignore_for_file: constant_identifier_names

// ENTRANCE: 채팅방 최초 입장
// CHAT_IN: 채팅방 입장
// CHAT: 유저 채팅
// CHAT_OUT: 채팅방 퇴장
// EXIT: 채팅방 완전히 퇴장
enum InChatEventType { ENTRANCE, CHAT_IN, CHAT, CHAT_OUT, EXIT }

enum InChatEventStatus { SUCCESS, FAIL }

enum InChatDataType { TEXT, IMAGE, VIDEO }
