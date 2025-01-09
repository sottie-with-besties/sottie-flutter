// ignore_for_file: constant_identifier_names

enum SottieCategory {
  ALL('전체'),
  THUNDER('번개'),
  FRIENDSHIP('친목'),
  STUDY('공부'),
  HIRING('구인/구직'),
  GAME('게임'),
  EXERCISE('운동'),
  OTHERS('기타');

  final String koreanName;

  const SottieCategory(
    this.koreanName,
  );
}
