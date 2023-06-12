import 'package:toplife/main_systems/system_age/age.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_age/usecases/get_days_lived_usecase.dart';

class CheckIfPersonIsAtLeastThisAgeUsecase {
  final GetDaysLivedUsecase _getDaysLivedUsecase;

  const CheckIfPersonIsAtLeastThisAgeUsecase(
    this._getDaysLivedUsecase,
  );

  bool execute({
    required int currentDay,
    required int dayOfBirth,
    required LifeStage age,
  }) {
    final int daysLived = _getDaysLivedUsecase.execute(
      dayOfBirth: dayOfBirth,
      currentDay: currentDay,
    );

    switch (age) {
      case LifeStage.baby:
        return daysLived > 0;
      case LifeStage.toddler:
        return daysLived >= Age.newToddlerDaysLived;
      case LifeStage.child:
        return daysLived >= Age.newChildDaysLived;
      case LifeStage.teen:
        return daysLived >= Age.newTeenDaysLived;
      case LifeStage.youngAdult:
        return daysLived >= Age.newYoungAdultDaysLived;
      case LifeStage.adult:
        return daysLived >= Age.newAdultDaysLived;
      case LifeStage.elder:
        return daysLived >= Age.newElderDaysLived;
    }
  }
}
