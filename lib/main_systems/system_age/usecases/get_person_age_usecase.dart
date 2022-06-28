import 'package:toplife/main_systems/system_age/age.dart';

class GetPersonAgeUsecase {
  Age execute({
    required int dayOfBirth,
    required int currentDay,
  }) {
    return Age.getAge(
      currentDay: currentDay,
      dayOfBirth: dayOfBirth,
    );
  }
}
