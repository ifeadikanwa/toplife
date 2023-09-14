import 'package:toplife/main_systems/system_age/usecases/check_if_person_is_at_least_this_age_usecase.dart';
import 'package:toplife/main_systems/system_age/usecases/get_a_day_of_birth_from_a_list_of_possible_life_stages_usecase.dart';
import 'package:toplife/main_systems/system_age/usecases/get_day_of_birth_from_days_lived_usecase.dart';
import 'package:toplife/main_systems/system_age/usecases/get_day_of_next_birthday_usecase.dart';
import 'package:toplife/main_systems/system_age/usecases/get_days_lived_usecase.dart';
import 'package:toplife/main_systems/system_age/usecases/get_random_day_of_birth_in_a_life_stage_usecase.dart';
import 'package:toplife/main_systems/system_age/usecases/get_person_age_usecase.dart';

class AgeUsecases {
  
  GetPersonAgeUsecase get getPersonAgeUsecase => GetPersonAgeUsecase();

  GetDayOfBirthFromDaysLivedUsecase get getDayOfBirthFromDaysLivedUsecase =>
      GetDayOfBirthFromDaysLivedUsecase();

  GetDayOfNextBirthdayUsecase get getDayOfNextBirthdayUsecase =>
      GetDayOfNextBirthdayUsecase();

  GetDaysLivedUsecase get getDaysLivedUsecase => GetDaysLivedUsecase();

  GetRandomDayOfBirthInALifeStageUsecase
      get getRandomDayOfBirthInALifeStageUsecase =>
          GetRandomDayOfBirthInALifeStageUsecase();

  GetADayOfBirthFromAListOfPossibleLifeStagesUsecase
      get getADayOfBirthFromAListOfPossibleLifeStagesUsecase =>
          GetADayOfBirthFromAListOfPossibleLifeStagesUsecase(
            getRandomDayOfBirthInALifeStageUsecase:
                getRandomDayOfBirthInALifeStageUsecase,
          );

  CheckIfPersonIsAtLeastThisAgeUsecase
      get checkIfPersonIsAtLeastThisAgeUsecase =>
          CheckIfPersonIsAtLeastThisAgeUsecase(
            getDaysLivedUsecase,
          );
}
