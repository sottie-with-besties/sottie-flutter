enum Category {
  all('All'),
  date('Date'),
  drinking('Drinking'),
  study('Study'),
  hiring('Hiring'),
  travel('Travel'),
  game('Game'),
  party('Party'),
  exercise('Exercise'),
  others('Others');

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
