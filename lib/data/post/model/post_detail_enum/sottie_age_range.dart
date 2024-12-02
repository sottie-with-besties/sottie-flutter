enum SottieAgeRange {
  all('나이 제한 없음'),
  teens('10대'),
  twenties('20대'),
  thirties('30대'),
  forties('40대'),
  fifties('50대'),
  sixties('60대'),
  seventies('70대'),
  eighties('80대 이상');

  final String name;

  const SottieAgeRange(this.name);
}
