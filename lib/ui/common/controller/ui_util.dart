/// 시간 관련 데이터는 UTC로 관리
/// 올해 이전의 시간은 연 + 월 + 일
/// 오늘이 아닌 시간은 월 + 일
/// 오늘의 시간은 오전/오후 + 시 : 분(0~9분 => 00분, 01분, 02분...)
String renderCustomStringTime(
    String utcTimeString, String compareDateUtcTimeString) {
  final compareTime = DateTime.parse(compareDateUtcTimeString);

  final latestTime = DateTime.parse(utcTimeString);
  final timeDifference = compareTime.difference(latestTime);

  late String customTime;

  if (latestTime.year != compareTime.year) {
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

/// int weekday => String 요일
String intToWeekday(int weekday) {
  switch (weekday) {
    case 1:
      return "월요일";
    case 2:
      return "화요일";
    case 3:
      return "수요일";
    case 4:
      return "목요일";
    case 5:
      return "금요일";
    case 6:
      return "토요일";
    case 7:
      return "일요일";
    default:
      return "요일 정보 없음";
  }
}

/// 남성: MALE, 여성: FEMALE
String convertGenderString(String gender) => gender == 'MALE' ? '남성' : '여성';
