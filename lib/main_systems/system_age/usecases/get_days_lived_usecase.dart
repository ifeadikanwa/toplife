import 'package:toplife/main_systems/system_age/age.dart';

class GetDaysLivedUsecase {
  int execute({
    required int dayOfBirth,
    required int currentDay,
  }) {
    return Age.getDaysLived(currentDay, dayOfBirth);
  }
}
