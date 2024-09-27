/// 시간 관련 데이터는 UTC로 관리
/// 올해 이전의 시간은 연 + 월 + 일
/// 오늘이 아닌 시간은 월 + 일
/// 오늘의 시간은 오전/오후 + 시 : 분(0~9분 => 00분, 01분, 02분...)
String renderCustomStringTime(String utcTimeString) {
  final now = DateTime.now();

  final latestTime = DateTime.parse(utcTimeString);
  final timeDifference = now.difference(latestTime);

  late String customTime;

  if (latestTime.year != now.year) {
    customTime = '${latestTime.year}년 ${latestTime.month}월 ${latestTime.day}일';
  } else if (timeDifference.inDays > 0) {
    customTime = '${latestTime.month}월 ${latestTime.day}일';
  } else {
    final dayString = latestTime.hour < 12 ? '오전' : '오후';
    final hour =
        latestTime.hour > 12 ? '${latestTime.hour - 12}' : '${latestTime.hour}';

    customTime =
        '$dayString $hour : ${latestTime.minute.toString().padLeft(2, '0')}';
  }

  return customTime;
}
