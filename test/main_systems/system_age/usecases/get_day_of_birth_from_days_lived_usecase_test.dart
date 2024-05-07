import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/get_day_of_birth_from_days_lived_usecase.dart';

void main() {
  group("GetDayOfBirthFromDaysLivedUsecase: ", () {
    final GetDayOfBirthFromDaysLivedUsecase sut =
        GetDayOfBirthFromDaysLivedUsecase();

    test(
        "getBirthDayFromDaysLived returns -10 as birthday if you've lived 20 days and the current day is 10",
        () {
      expect(
        sut.execute(currentDay: 10, daysLived: 20),
        -10,
      );
    });
  });
}
