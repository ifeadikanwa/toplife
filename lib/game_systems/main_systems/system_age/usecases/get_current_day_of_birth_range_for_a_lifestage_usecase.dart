import 'package:toplife/core/utils/stats/stats_range/stats_range.dart';
import 'package:toplife/game_systems/main_systems/system_age/life_stage.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/get_days_lived_range_for_a_lifestage_usecase.dart';

class GetCurrentDayOfBirthRangeForALifeStageUsecase {
  final GetDaysLivedRangeForALifestageUsecase
      _getDaysLivedRangeForALifestageUsecase;

  const GetCurrentDayOfBirthRangeForALifeStageUsecase(
      this._getDaysLivedRangeForALifestageUsecase);

  StatsRange execute({
    required int currentDay,
    required LifeStage lifeStage,
  }) {
    final StatsRange daysLivedRangeForLifeStage =
        _getDaysLivedRangeForALifestageUsecase.execute(
      lifeStage: lifeStage,
    );

    //because day of birth increases as the days pass, an older person will have a smaller day of birth than a younger person
    //max day of birth belongs to people that just started that lifestage (min days lived)
    //min day of birth belongs to people on the last day of that lifestage (max days lived)

    //max
    final int maxDayOfBirth = currentDay - daysLivedRangeForLifeStage.min;

    //min
    final int minDayOfBirth = currentDay - daysLivedRangeForLifeStage.max;

    return StatsRange(
      min: minDayOfBirth,
      max: maxDayOfBirth,
    );
  }
}
