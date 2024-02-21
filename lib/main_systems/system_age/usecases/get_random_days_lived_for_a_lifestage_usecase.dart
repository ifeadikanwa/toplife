import 'dart:math';

import 'package:toplife/core/utils/numbers/get_value_in_specific_part_of_range.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range.dart';
import 'package:toplife/main_systems/system_age/age_constants.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_age/usecases/get_days_lived_range_for_a_lifestage_usecase.dart';

class GetRandomDaysLivedInALifestage {
  final GetDaysLivedRangeForALifestageUsecase
      _getDaysLivedRangeForALifestageUsecase;

  const GetRandomDaysLivedInALifestage(
    this._getDaysLivedRangeForALifestageUsecase,
  );

  //this generates a random age(days lived) in a stage that can be used to create a birthday for a person
  int execute({
    required LifeStage lifeStage,
    bool earlyStageInAge = false,
    bool lateStageInAge = false,
  }) {
    //check what life stage
    //get the range for that life stage
    //if earlyStage is true, divide the range in 2 and return a random value from the first half
    //if lateStage is true, divide the range in 2 and return value from secon half
    //else return a random value from the range

    switch (lifeStage) {
      case LifeStage.baby:
        if (earlyStageInAge) {
          return 0;
        } else if (lateStageInAge) {
          return AgeConstants.babyMaxDaysLived;
        } else {
          return Random().nextInt(AgeConstants.babyMaxDaysLived);
        }

      case LifeStage.toddler:
        final StatsRange toddlerDaysLivedRange =
            _getDaysLivedRangeForALifestageUsecase.execute(
          lifeStage: LifeStage.toddler,
        );

        return getValueInSpecificPartOfRange(
          getFromFirstHalf: earlyStageInAge,
          getFromSecondHalf: lateStageInAge,
          lowestValue: toddlerDaysLivedRange.min,
          highestValue: toddlerDaysLivedRange.max,
        );

      case LifeStage.child:
        final StatsRange childDaysLivedRange =
            _getDaysLivedRangeForALifestageUsecase.execute(
          lifeStage: LifeStage.child,
        );

        return getValueInSpecificPartOfRange(
          getFromFirstHalf: earlyStageInAge,
          getFromSecondHalf: lateStageInAge,
          lowestValue: childDaysLivedRange.min,
          highestValue: childDaysLivedRange.max,
        );

      case LifeStage.teen:
        final StatsRange teenDaysLivedRange =
            _getDaysLivedRangeForALifestageUsecase.execute(
          lifeStage: LifeStage.teen,
        );

        return getValueInSpecificPartOfRange(
          getFromFirstHalf: earlyStageInAge,
          getFromSecondHalf: lateStageInAge,
          lowestValue: teenDaysLivedRange.min,
          highestValue: teenDaysLivedRange.max,
        );

      case LifeStage.youngAdult:
        final StatsRange youngAdultDaysLivedRange =
            _getDaysLivedRangeForALifestageUsecase.execute(
          lifeStage: LifeStage.youngAdult,
        );

        return getValueInSpecificPartOfRange(
          getFromFirstHalf: earlyStageInAge,
          getFromSecondHalf: lateStageInAge,
          lowestValue: youngAdultDaysLivedRange.min,
          highestValue: youngAdultDaysLivedRange.max,
        );

      case LifeStage.adult:
        final StatsRange adultDaysLivedRange =
            _getDaysLivedRangeForALifestageUsecase.execute(
          lifeStage: LifeStage.adult,
        );

        return getValueInSpecificPartOfRange(
          getFromFirstHalf: earlyStageInAge,
          getFromSecondHalf: lateStageInAge,
          lowestValue: adultDaysLivedRange.min,
          highestValue: adultDaysLivedRange.max,
        );

      case LifeStage.elder:
        final StatsRange elderDaysLivedRange =
            _getDaysLivedRangeForALifestageUsecase.execute(
          lifeStage: LifeStage.elder,
        );

        return getValueInSpecificPartOfRange(
          getFromFirstHalf: earlyStageInAge,
          getFromSecondHalf: lateStageInAge,
          lowestValue: elderDaysLivedRange.min,
          highestValue: elderDaysLivedRange.max,
        );
    }
  }
}
