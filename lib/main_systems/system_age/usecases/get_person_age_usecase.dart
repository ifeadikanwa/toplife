import 'package:toplife/main_systems/system_age/age.dart';

class GetPersonAgeUsecase {
  Age execute({
    required int birthday,
    required int currentDay,
  }) {
    return Age.getAge(
      currentDay: currentDay,
      birthday: birthday,
    );
  }
}
