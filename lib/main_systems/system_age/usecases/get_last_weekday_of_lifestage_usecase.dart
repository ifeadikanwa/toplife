import 'package:toplife/core/utils/day_of_week/check_if_day_is_a_weekend.dart';
import 'package:toplife/main_systems/system_age/usecases/get_last_day_of_lifestage_usecase.dart';

class GetLastWeekDayOfLifeStageUsecase {
  final GetLastDayOfLifeStageUsecase _getLastDayOfLifeStageUsecase;

  const GetLastWeekDayOfLifeStageUsecase(this._getLastDayOfLifeStageUsecase);

  Future<int> execute({
    required int currentDay,
    required int personID,
  }) async {
    final int lastDayOfLifeStage = await _getLastDayOfLifeStageUsecase.execute(
      currentDay: currentDay,
      personID: personID,
    );

    //set the day we are currently checking to the found last day
    int dayCurrentlyChecking = lastDayOfLifeStage;

    //as long as it is a valid day, keep checking
    while (dayCurrentlyChecking > 0) {
      //if it is a weekend
      if (checkIfDayIsAWeekend(day: dayCurrentlyChecking)) {
        //make the day currently checking, the previous day
        dayCurrentlyChecking--;
      }
      // else it is a weekday
      else {
        //return the day
        return dayCurrentlyChecking;
      }
    }

    //if no day was found
    return 0;
  }
}
