class GetPersonsDaysLivedUsecase {
  const GetPersonsDaysLivedUsecase();

  int execute({
    required int currentDay,
    required int dayOfBirth,
  }) {
    return currentDay - dayOfBirth;
  }
}
