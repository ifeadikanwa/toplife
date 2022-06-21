import 'package:toplife/main_systems/system_age/usecases/get_a_birthday_from_a_list_of_possible_life_stages_usecase.dart';
import 'package:toplife/main_systems/system_age/usecases/get_random_birthday_in_a_life_stage_usecase.dart';
import 'package:toplife/main_systems/system_age/usecases/get_person_age_usecase.dart';

class AgeUsecases {
  GetPersonAgeUsecase get getPersonAgeUsecase => GetPersonAgeUsecase();

  GetRandomBirthdayInALifeStageUsecase
      get getRandomBirthdayInALifeStageUsecase =>
          GetRandomBirthdayInALifeStageUsecase();

  GetABirthdayFromAListOfPossibleLifeStagesUsecase
      get getABirthdayFromAListOfPossibleLifeStagesUsecase =>
          GetABirthdayFromAListOfPossibleLifeStagesUsecase(
            getRandomBirthdayInALifeStageUsecase:
                getRandomBirthdayInALifeStageUsecase,
          );
}
