import 'package:toplife/game_systems/main_systems/system_age/life_stage.dart';

class AgeConstants {
  //DaysLived For a new lifestage. Used to detect birthdays celebrations.
  static const newBabyDaysLived = 0;
  static final newToddlerDaysLived = babyMaxDaysLived + 1;
  static final newChildDaysLived = toddlerMaxDaysLived + 1;
  static final newTeenDaysLived = childMaxDaysLived + 1;
  static final newYoungAdultDaysLived = teenMaxDaysLived + 1;
  static final newAdultDaysLived = youngAdultMaxDaysLived + 1;
  static final newElderDaysLived = adultMaxDaysLived + 1;

  //Age Limits (max DaysLived in a lifestage)
  static final babyMaxDaysLived = LifeStage.baby.stageDuration;
  static final toddlerMaxDaysLived =
      babyMaxDaysLived + LifeStage.toddler.stageDuration;
  static final childMaxDaysLived =
      toddlerMaxDaysLived + LifeStage.child.stageDuration;
  static final teenMaxDaysLived =
      childMaxDaysLived + LifeStage.teen.stageDuration;
  static final youngAdultMaxDaysLived =
      teenMaxDaysLived + LifeStage.youngAdult.stageDuration;
  static final adultMaxDaysLived =
      youngAdultMaxDaysLived + LifeStage.adult.stageDuration;
  static final elderMaxDaysLived =
      adultMaxDaysLived + LifeStage.elder.stageDuration;
}
