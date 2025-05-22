enum AlarmType {
  event('이벤트'),
  dm('DM'),
  chat('채팅');

  final String name;

  const AlarmType(this.name);
}
