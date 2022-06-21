import 'package:toplife/main_systems/system_age/usecases/get_random_birthday_in_a_life_stage_usecase.dart';
import 'package:toplife/main_systems/system_age/usecases/get_person_age_usecase.dart';

class AgeUsecases {
  GetPersonAgeUsecase get getPersonAgeUsecase => GetPersonAgeUsecase();

  GetRandomBirthdayInALifeStageUsecase get getBirthdayInALifeStageUsecase =>
      GetRandomBirthdayInALifeStageUsecase();
}
