enum SottieGenderRestrictions {
  all("성별 제한 없음"),
  manOnly("남성"),
  womanOnly("여성"),
  nobody("성별을 선택해 주세요"); // => 프론트에서 예외 처리.

  final String name;

  const SottieGenderRestrictions(this.name);
}
