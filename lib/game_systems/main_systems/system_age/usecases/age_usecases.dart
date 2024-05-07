import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/school/school_dependencies_providers.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/age_up_character_actions/age_up_character_actions_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/age_up_character_actions/age_up_to_adult_actions_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/age_up_character_actions/age_up_to_child_actions_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/age_up_character_actions/age_up_to_elder_actions_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/age_up_character_actions/age_up_to_teen_actions_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/age_up_character_actions/age_up_to_toddler_actions_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/age_up_character_actions/age_up_to_young_adult_actions_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/check_if_person_is_at_least_this_age_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/get_a_day_of_birth_from_a_list_of_possible_life_stages_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/get_current_day_of_birth_range_for_a_lifestage_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/get_day_of_birth_from_days_lived_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/get_day_of_next_birthday_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/get_days_lived_range_for_a_lifestage_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/get_last_day_of_lifestage_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/get_last_weekday_of_lifestage_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/get_persons_age_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/get_persons_days_lived_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/get_random_day_of_birth_in_a_life_stage_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/get_random_days_lived_for_a_lifestage_usecase.dart';

class AgeUsecases {
  final Ref _ref;

  const AgeUsecases({required Ref ref}) : _ref = ref;

  GetPersonsAgeUsecase get getPersonsAgeUsecase => const GetPersonsAgeUsecase();

  GetDayOfBirthFromDaysLivedUsecase get getDayOfBirthFromDaysLivedUsecase =>
      GetDayOfBirthFromDaysLivedUsecase();

  GetDayOfNextBirthdayUsecase get getDayOfNextBirthdayUsecase =>
      GetDayOfNextBirthdayUsecase(getPersonsAgeUsecase);

  GetDaysLivedRangeForALifestageUsecase
      get getDaysLivedRangeForALifestageUsecase =>
          const GetDaysLivedRangeForALifestageUsecase();

  GetPersonsDaysLivedUsecase get getPersonsDaysLived =>
      const GetPersonsDaysLivedUsecase();

  GetRandomDayOfBirthInALifeStageUsecase
      get getRandomDayOfBirthInALifeStageUsecase =>
          GetRandomDayOfBirthInALifeStageUsecase(
            getRandomDaysLivedInALifestage,
            getDayOfBirthFromDaysLivedUsecase,
          );

  GetRandomDaysLivedInALifestage get getRandomDaysLivedInALifestage =>
      GetRandomDaysLivedInALifestage(getDaysLivedRangeForALifestageUsecase);

  GetADayOfBirthFromAListOfPossibleLifeStagesUsecase
      get getADayOfBirthFromAListOfPossibleLifeStagesUsecase =>
          GetADayOfBirthFromAListOfPossibleLifeStagesUsecase(
            getRandomDayOfBirthInALifeStageUsecase:
                getRandomDayOfBirthInALifeStageUsecase,
          );

  CheckIfPersonIsAtLeastThisAgeUsecase
      get checkIfPersonIsAtLeastThisAgeUsecase =>
          CheckIfPersonIsAtLeastThisAgeUsecase(
            getPersonsDaysLived,
          );

  GetCurrentDayOfBirthRangeForALifeStageUsecase
      get getCurrentDayOfBirthRangeForALifeStageUsecase =>
          GetCurrentDayOfBirthRangeForALifeStageUsecase(
            getDaysLivedRangeForALifestageUsecase,
          );

  AgeUpCharacterActionsUsecase get ageUpCharacterActionsUsecase =>
      AgeUpCharacterActionsUsecase(
        _ref.read(personUsecasesProvider),
        getPersonsAgeUsecase,
        ageUpToToddlerActionsUsecase,
        ageUpToChildActionsUsecase,
        ageUpToTeenActionsUsecase,
        ageUpToYoungAdultActionsUsecase,
        ageUpToAdultActionsUsecase,
        ageUpToElderActionsUsecase,
      );

  AgeUpToToddlerActionsUsecase get ageUpToToddlerActionsUsecase =>
      AgeUpToToddlerActionsUsecase(
        _ref.read(schoolUsecasesProvider),
      );

  AgeUpToChildActionsUsecase get ageUpToChildActionsUsecase =>
      AgeUpToChildActionsUsecase(
        _ref.read(schoolUsecasesProvider),
      );

  AgeUpToTeenActionsUsecase get ageUpToTeenActionsUsecase =>
      AgeUpToTeenActionsUsecase(
        _ref.read(schoolUsecasesProvider),
      );

  AgeUpToYoungAdultActionsUsecase get ageUpToYoungAdultActionsUsecase =>
      AgeUpToYoungAdultActionsUsecase(
        _ref.read(schoolUsecasesProvider),
      );

  AgeUpToAdultActionsUsecase get ageUpToAdultActionsUsecase =>
      const AgeUpToAdultActionsUsecase();

  AgeUpToElderActionsUsecase get ageUpToElderActionsUsecase =>
      const AgeUpToElderActionsUsecase();

  GetLastDayOfLifeStageUsecase get getLastDayOfLifeStageUsecase =>
      GetLastDayOfLifeStageUsecase(
        _ref.read(personUsecasesProvider),
        getPersonsAgeUsecase,
      );

  GetLastWeekDayOfLifeStageUsecase get getLastWeekDayOfLifeStageUsecase =>
      GetLastWeekDayOfLifeStageUsecase(
        getLastDayOfLifeStageUsecase,
      );
}
