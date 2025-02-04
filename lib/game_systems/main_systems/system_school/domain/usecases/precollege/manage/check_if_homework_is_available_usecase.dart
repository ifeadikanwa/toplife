import 'package:toplife/core/utils/day_of_week/check_if_day_is_a_weekend.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/model/info_models/precollege_info.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/precollege/manage/get_current_precollege_usecase.dart';

class CheckIfHomeworkIsAvailableUsecase {
  final GetCurrentPrecollegeUsecase _getCurrentPrecollegeUsecase;

  const CheckIfHomeworkIsAvailableUsecase(this._getCurrentPrecollegeUsecase);

  Future<bool> execute({
    required int currentPlayerID,
    required int currentDay,
  }) async {
    //get the current precollege
    final PrecollegeInfo? currentPrecollegeInfo =
        await _getCurrentPrecollegeUsecase.execute(
      personID: currentPlayerID,
      currentDay: currentDay,
    );

    //if we have a valid precollege
    if (currentPrecollegeInfo != null) {
      //check if coursework is available

      //TRUE if:
      //it is NOT a weekend
      //AND school has been attended today
      //AND no homework has been submitted today
      return (!checkIfDayIsAWeekend(day: currentDay) &&
          currentPrecollegeInfo.precollege.lastSchoolAttendanceDay ==
              currentDay &&
          currentPrecollegeInfo.precollege.lastHomeworkSubmissionDay !=
              currentDay);
    }

    return false;
  }
}
