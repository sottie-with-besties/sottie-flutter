// 올해 이전의 시간은 연 + 월 + 일
// 오늘이 아닌 시간은 월 + 일
// 오늘의 시간은 오전/오후 + 시 : 분(0~9분 => 00분, 01분, 02분...)
// String renderCustomStringTime(
//   DateTime utcTimeString,
//   DateTime compareDateUtcTimeString,
// ) {
//   final timeDifference = compareDateUtcTimeString.difference(utcTimeString);
//
//   late String customTime;
//
//   if (utcTimeString.year != compareDateUtcTimeString.year) {
//     customTime =
//         '${utcTimeString.year}년 ${utcTimeString.month}월 ${utcTimeString.day}일';
//   } else if (timeDifference.inDays > 0) {
//     customTime = '${utcTimeString.month}월 ${utcTimeString.day}일';
//   } else {
//     final dayString = utcTimeString.hour < 12 ? '오전' : '오후';
//     final hour =
//         utcTimeString.hour > 12
//             ? '${utcTimeString.hour - 12}'
//             : '${utcTimeString.hour}';
//
//     customTime =
//         '$dayString $hour : ${utcTimeString.minute.toString().padLeft(2, '0')}';
//   }
//
//   return customTime;
// }

// int weekday => String 요일
String convertIntToWeekday(int weekday) {
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

// 날짜 문자열로 바꾸기
String convertDateTimeIntoString(DateTime datetime) {
  final dayString = datetime.hour < 12 ? '오전' : '오후';
  final hour =
      datetime.hour > 12 ? '${datetime.hour - 12}' : '${datetime.hour}';

  final customTime =
      '$dayString $hour : ${datetime.minute.toString().padLeft(2, '0')}';

  final dateString =
      '${datetime.month}월 ${datetime.day}일 ${convertIntToWeekday(datetime.weekday)} $customTime';
  return dateString;
}

String convertAgeRangeToString(int ageFrom, int ageTo) {
  String ageRangeString = '';

  for (int i = (ageFrom / 10).toInt(); i <= (ageTo / 10).toInt(); i++) {
    ageRangeString = '$ageRangeString, ${i}0대';
  }

  return ageRangeString.substring(2);
}
