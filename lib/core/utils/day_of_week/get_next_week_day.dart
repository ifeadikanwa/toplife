int getNextWeekDay(int currentDay, int daysToSkip) {
  //add days to skip to current day to get starting day
  int startingDay = currentDay + daysToSkip;
  int dayOfWeek = startingDay % 7;

  switch (dayOfWeek) {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
      return startingDay + 1;
    case 5:
      return startingDay + 3;
    case 6:
      return startingDay + 2;
    default:
      return startingDay + 1;
  }
}
