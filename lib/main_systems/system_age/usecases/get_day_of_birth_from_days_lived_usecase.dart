class GetDayOfBirthFromDaysLivedUsecase {
  int execute({
    required int daysLived,
    required int currentDay,
  }) {
    //get day of birth so that age deduction will be consistent
    return currentDay - daysLived;
  }
}
