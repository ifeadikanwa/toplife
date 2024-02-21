import 'package:toplife/core/utils/stats/stats_range/stats_range.dart';
import 'package:toplife/main_systems/system_age/age_constants.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';

class GetDaysLivedRangeForALifestageUsecase {
  const GetDaysLivedRangeForALifestageUsecase();

  StatsRange execute({required LifeStage lifeStage}) {
    switch (lifeStage) {
      case LifeStage.baby:
        return StatsRange(
          min: AgeConstants.newBabyDaysLived,
          max: AgeConstants.babyMaxDaysLived,
        );
      case LifeStage.toddler:
        return StatsRange(
          min: AgeConstants.newToddlerDaysLived,
          max: AgeConstants.toddlerMaxDaysLived,
        );
      case LifeStage.child:
        return StatsRange(
          min: AgeConstants.newChildDaysLived,
          max: AgeConstants.childMaxDaysLived,
        );
      case LifeStage.teen:
        return StatsRange(
          min: AgeConstants.newTeenDaysLived,
          max: AgeConstants.teenMaxDaysLived,
        );
      case LifeStage.youngAdult:
        return StatsRange(
          min: AgeConstants.newYoungAdultDaysLived,
          max: AgeConstants.youngAdultMaxDaysLived,
        );
      case LifeStage.adult:
        return StatsRange(
          min: AgeConstants.newAdultDaysLived,
          max: AgeConstants.adultMaxDaysLived,
        );
      case LifeStage.elder:
        return StatsRange(
          min: AgeConstants.newElderDaysLived,
          max: AgeConstants.elderMaxDaysLived,
        );
    }
  }
}
