enum Category {
  all('전체'),
  date('소개팅'),
  drinking('술'),
  study('공부'),
  hiring('구인/구직'),
  travel('여행'),
  game('게임'),
  party('파티'),
  exercise('운동'),
  others('기타');

  final String name;

  const Category(
    this.name,
  );
}
