import 'package:toplife/main_systems/system_age/age.dart';

class GetDayOfNextBirthdayUsecase {
  int? execute({
    required int dayOfBirth,
    required int currentDay,
  }) {
    return Age.getDayOfNextBirthday(
      currentDay: currentDay,
      dayOfBirth: dayOfBirth,
    );
  }
}
