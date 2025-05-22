// ignore_for_file: constant_identifier_names

enum PostAgeRange {
  teens('10대'),
  twenties('20대'),
  thirties('30대'),
  forties('40대'),
  fifties('50대'),
  sixties('60대');

  final String name;

  const PostAgeRange(this.name);
}

enum PostCategory {
  ALL('전체'),
  THUNDER('번개'),
  FRIENDSHIP('친목'),
  STUDY('공부'),
  HIRING('구인/구직'),
  GAME('게임'),
  EXERCISE('운동'),
  OTHERS('기타');

  final String koreanName;

  const PostCategory(this.koreanName);
}

enum PostGenderRestriction { NONE, MIX, MALE, FEMALE }

enum PostLocation {
  all(1, "전국"),
  seoul(2, "서울"),
  suwon(3, "수원"),
  sungnam(4, "성남"),
  sungnam1(5, "성남"),
  sungnam2(6, "성남"),
  sungnam3(7, "성남"),
  sungnam4(8, "성남"),
  sungnam5(9, "성남"),
  sungnam6(10, "성남"),
  sungnam78(11, "성남"),
  sungna11m6(12, "성남"),
  sungnam345(13, "성남"),
  sungna34m(14, "성남"),
  sungn23am(15, "성남");

  final int id;
  final String koreanName;

  const PostLocation(this.id, this.koreanName);
}
