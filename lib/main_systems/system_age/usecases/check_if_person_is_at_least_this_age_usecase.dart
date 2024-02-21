import 'package:toplife/main_systems/system_age/age_constants.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_age/usecases/get_persons_days_lived_usecase.dart';

class CheckIfPersonIsAtLeastThisAgeUsecase {
  final GetPersonsDaysLivedUsecase _getPersonsDaysLivedUsecase;

  const CheckIfPersonIsAtLeastThisAgeUsecase(
    this._getPersonsDaysLivedUsecase,
  );

  bool execute({
    required int currentDay,
    required int dayOfBirth,
    required LifeStage age,
  }) {
    final int daysLived = _getPersonsDaysLivedUsecase.execute(
      dayOfBirth: dayOfBirth,
      currentDay: currentDay,
    );

    switch (age) {
      case LifeStage.baby:
        return daysLived >= 0;
      case LifeStage.toddler:
        return daysLived >= AgeConstants.newToddlerDaysLived;
      case LifeStage.child:
        return daysLived >= AgeConstants.newChildDaysLived;
      case LifeStage.teen:
        return daysLived >= AgeConstants.newTeenDaysLived;
      case LifeStage.youngAdult:
        return daysLived >= AgeConstants.newYoungAdultDaysLived;
      case LifeStage.adult:
        return daysLived >= AgeConstants.newAdultDaysLived;
      case LifeStage.elder:
        return daysLived >= AgeConstants.newElderDaysLived;
    }
  }
}
