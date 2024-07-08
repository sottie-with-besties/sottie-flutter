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

  static int lengthOfCategory() => 10;

  static Category getByIndex(int index) {
    late Category category;

    switch (index) {
      case 0:
        category = Category.all;
        break;
      case 1:
        category = Category.date;
        break;
      case 2:
        category = Category.drinking;
        break;
      case 3:
        category = Category.study;
        break;
      case 4:
        category = Category.hiring;
        break;
      case 5:
        category = Category.travel;
        break;
      case 6:
        category = Category.game;
        break;
      case 7:
        category = Category.party;
        break;
      case 8:
        category = Category.exercise;
        break;
      case 9:
        category = Category.others;
        break;
      default:
        category = Category.all;
        break;
    }
    return category;
  }
}
