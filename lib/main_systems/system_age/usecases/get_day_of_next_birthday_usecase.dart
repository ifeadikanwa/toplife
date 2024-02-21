import 'package:toplife/main_systems/system_age/age.dart';
import 'package:toplife/main_systems/system_age/age_constants.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_age/usecases/get_persons_age_usecase.dart';

class GetDayOfNextBirthdayUsecase {
  final GetPersonsAgeUsecase _getPersonsAgeUsecase;

  const GetDayOfNextBirthdayUsecase(
    this._getPersonsAgeUsecase,
  );

  int? execute({
    required int currentDay,
    required int dayOfBirth,
  }) {
    //get the day a person will move to the next life stage

    //calculate current days lived
    //get their age so you know their current lifestage
    //if their current lifestage is elder return null
    //or else calculate the days till their next life stage
    //add the answer to the current day
    //return that

    int currentDaysLived = currentDay - dayOfBirth;

    final Age currentAge = _getPersonsAgeUsecase.execute(
      currentDay: currentDay,
      dayOfBirth: dayOfBirth,
    );

    late final int daysTillNextBirthday;

    switch (currentAge.lifeStage) {
      case LifeStage.baby:
        daysTillNextBirthday =
            AgeConstants.newToddlerDaysLived - currentDaysLived;
        break;
      case LifeStage.toddler:
        daysTillNextBirthday =
            AgeConstants.newChildDaysLived - currentDaysLived;
        break;
      case LifeStage.child:
        daysTillNextBirthday = AgeConstants.newTeenDaysLived - currentDaysLived;
        break;
      case LifeStage.teen:
        daysTillNextBirthday =
            AgeConstants.newYoungAdultDaysLived - currentDaysLived;
        break;
      case LifeStage.youngAdult:
        daysTillNextBirthday =
            AgeConstants.newAdultDaysLived - currentDaysLived;
        break;
      case LifeStage.adult:
        daysTillNextBirthday =
            AgeConstants.newElderDaysLived - currentDaysLived;
        return currentDay + daysTillNextBirthday;
      case LifeStage.elder:
        return null;
    }

    return currentDay + daysTillNextBirthday;
  }
}
