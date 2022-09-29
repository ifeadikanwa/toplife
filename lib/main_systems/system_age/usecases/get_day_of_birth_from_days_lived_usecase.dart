import 'package:toplife/main_systems/system_age/age.dart';

class GetDayOfBirthFromDaysLivedUsecase {
  int execute({
    required int daysLived,
    required int currentDay,
  }) {
    return Age.getDayOfBirthFromDaysLived(
      currentDay: currentDay,
      daysLived: daysLived,
    );
  }
}
