import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/age/age_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/job/job_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/journal/journal_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/create/create_or_update_death_record_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/get/get_death_record_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/get/get_living_people_in_specific_lifestage_and_country_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/get/get_living_people_in_specific_lifestage_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/get/get_person_available_piercing_locations_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/get/get_person_deplete_stats_flag_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/get/get_piercing_from_shop_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/get/get_player_information_from_data_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/get/get_tattoo_from_shop_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_deplete_stats_flag/create_or_update_deplete_stats_flag_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_deplete_stats_flag/delete_person_deplete_stats_flag_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_deplete_stats_flag/reset_deplete_stats_flag_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_deplete_stats_flag/toggle_deplete_stats_flag_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_money/add_money_to_player_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_money/check_if_player_can_afford_it_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_person/create_given_person_with_attributes_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_person/create_people_from_scratch_with_attributes_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_person/create_person_from_scratch_with_attributes_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_person/delete_person_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_person/generate_baby_traits_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_person/generate_person_appearance_from_parents_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_person/generate_person_appearance_from_scratch_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_person/generate_person_piercings_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_person/generate_person_tattoos_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_person/generate_personality_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_person/generate_stance_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_person/generate_stats_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_survival_stats/npc/deplete_baby_energy_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_survival_stats/npc/deplete_baby_hunger_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_survival_stats/player/deplete/deplete_main_player_athleticism_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_survival_stats/player/deplete/deplete_main_player_energy_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_survival_stats/player/deplete/deplete_main_player_health_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_survival_stats/player/deplete/deplete_main_player_hunger_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_survival_stats/npc/deplete_non_player_hunger_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_survival_stats/player/deplete/deplete_main_player_mood_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_survival_stats/player/increase/eat/eat_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_person/generate_a_person_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_person/generate_list_of_person_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/get/get_person_stats_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/get/get_person_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/get/get_player_money_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_survival_stats/npc/make_non_player_hungry_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_survival_stats/player/increase/eat/quick_eat_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_survival_stats/player/increase/increase_main_player_soberness_usecase.dart.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_survival_stats/player/increase/sleep_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_money/take_money_from_player_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_survival_stats/player/side_effects/energy_and_hunger_emergency_mode_side_effects_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/update_general/update_person_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/update_general/update_stats_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/update_specific_stats/update_athleticism_stats_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/update_specific_stats/update_energy_stats_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/update_specific_stats/update_health_stats_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/update_specific_stats/update_hunger_stats_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/update_specific_stats/update_intellect_stats_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/update_specific_stats/update_looks_stats_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/update_specific_stats/update_sober_stats_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/update_specific_stats/update_mood_stats_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/watch/watch_person_stats_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/watch/watch_person_usecase.dart';

class PersonUsecases {
  final Ref _ref;

  const PersonUsecases({required Ref ref}) : _ref = ref;

  GenerateAPersonUsecase get generateAPersonUsecase =>
      GenerateAPersonUsecase(ageUsecases: _ref.read(ageUsecasesProvider));

  GenerateListOfPersonUsecase get generateListOfPersonUsecase =>
      GenerateListOfPersonUsecase(
        generateAPersonUsecase: generateAPersonUsecase,
      );

  GeneratePersonalityUsecase get generatePersonalityUsecase =>
      GeneratePersonalityUsecase();

  GenerateStatsUsecase get generateStatsUsecase => GenerateStatsUsecase();

  GenerateStanceUsecase get generateStanceUsecase => GenerateStanceUsecase();

  GenerateBabyTraitsUsecase get generateBabyTraitsUsecase =>
      GenerateBabyTraitsUsecase();

  GeneratePersonAppearanceFromParentsUsecase
      get generatePersonAppearanceFromParentsUsecase =>
          GeneratePersonAppearanceFromParentsUsecase();

  GeneratePersonAppearanceFromScratchUsecase
      get generatePersonAppearanceFromScratchUsecase =>
          GeneratePersonAppearanceFromScratchUsecase();

  GeneratePersonTattooUsecase get generatePersonTattooUsecase =>
      GeneratePersonTattooUsecase();

  GeneratePersonPiercingsUsecase get generatePersonPiercingsUsecase =>
      GeneratePersonPiercingsUsecase();

  CreateGivenPersonWithAttributesUsecase
      get createGivenPersonWithAttributesUsecase =>
          CreateGivenPersonWithAttributesUsecase(
            personRepositories: _ref.read(personRepositoriesProvider),
            ageUsecases: _ref.read(ageUsecasesProvider),
            generatePersonalityUsecase: generatePersonalityUsecase,
            generateStatsUsecase: generateStatsUsecase,
            generateStanceUsecase: generateStanceUsecase,
            generateBabyTraitsUsecase: generateBabyTraitsUsecase,
            generatePersonAppearanceFromParentsUsecase:
                generatePersonAppearanceFromParentsUsecase,
            generatePersonAppearanceFromScratchUsecase:
                generatePersonAppearanceFromScratchUsecase,
            generatePersonTattooUsecase: generatePersonTattooUsecase,
            generatePersonPiercingsUsecase: generatePersonPiercingsUsecase,
          );

  CreatePersonFromScratchWithAttributesUsecase
      get createPersonFromScratchWithAttributesUsecase =>
          CreatePersonFromScratchWithAttributesUsecase(
            generateAPersonUsecase,
            createGivenPersonWithAttributesUsecase,
          );

  CreatePeopleFromScratchWithAttributesUsecase
      get createPeopleFromScratchWithAttributesUsecase =>
          CreatePeopleFromScratchWithAttributesUsecase(
            createPersonFromScratchWithAttributesUsecase,
          );

  GetPersonAvailablePiercingLocationsUsecase
      get getPersonAvailablePiercingLocationsUsecase =>
          GetPersonAvailablePiercingLocationsUsecase(
            _ref.read(personRepositoriesProvider).piercingRepositoryImpl,
          );

  GetPiercingFromShopUsecase get getPiercingFromShopUsecase =>
      GetPiercingFromShopUsecase(
        _ref.read(personRepositoriesProvider).piercingRepositoryImpl,
        checkIfPlayerCanAffordItUsecase,
        takeMoneyFromPlayerUsecase,
        _ref.read(journalUsecasesProvider),
      );

  GetTattooFromShopUsecase get getTattooFromShopUsecase =>
      GetTattooFromShopUsecase(
        _ref.read(personRepositoriesProvider).tattooRepositoryImpl,
        checkIfPlayerCanAffordItUsecase,
        takeMoneyFromPlayerUsecase,
        _ref.read(journalUsecasesProvider),
      );

  DepleteBabyEnergyUsecase get depleteBabyEnergyUsecase =>
      DepleteBabyEnergyUsecase(
        statsRepository:
            _ref.read(personRepositoriesProvider).statsRepositoryImpl,
      );

  DepleteBabyHungerUsecase get depleteBabyHungerUsecase =>
      DepleteBabyHungerUsecase(
        statsRepository:
            _ref.read(personRepositoriesProvider).statsRepositoryImpl,
        babyTraitsRepository:
            _ref.read(personRepositoriesProvider).babyTraitsRepositoryImpl,
      );

  DepleteMainPlayerEnergyUsecase get depleteMainPlayerEnergyUsecase =>
      DepleteMainPlayerEnergyUsecase(
        statsRepository:
            _ref.read(personRepositoriesProvider).statsRepositoryImpl,
        energyAndHungerEmergencyModeSideEffectUsecase:
            energyAndHungerEmergencyModeSideEffectUsecase,
      );

  DepleteMainPlayerHungerUsecase get depleteMainPlayerHungerUsecase =>
      DepleteMainPlayerHungerUsecase(
        statsRepository:
            _ref.read(personRepositoriesProvider).statsRepositoryImpl,
        energyAndHungerEmergencyModeSideEffectUsecase:
            energyAndHungerEmergencyModeSideEffectUsecase,
      );

  DepleteMainPlayerHealthUsecase get depleteMainPlayerHealthUsecase =>
      DepleteMainPlayerHealthUsecase(
        statsRepository:
            _ref.read(personRepositoriesProvider).statsRepositoryImpl,
      );

  DepleteMainPlayerMoodUsecase get depleteMainPlayerMoodUsecase =>
      DepleteMainPlayerMoodUsecase(
        statsRepository:
            _ref.read(personRepositoriesProvider).statsRepositoryImpl,
      );

  DepleteMainPlayerAthleticismUsecase get depleteMainPlayerAthleticismUsecase =>
      DepleteMainPlayerAthleticismUsecase(
        statsRepository:
            _ref.read(personRepositoriesProvider).statsRepositoryImpl,
      );

  IncreaseMainPlayerSobernessUsecase get increaseMainPlayerSobernessUsecase =>
      IncreaseMainPlayerSobernessUsecase(
        statsRepository:
            _ref.read(personRepositoriesProvider).statsRepositoryImpl,
      );

  DepleteNonPlayerHungerUsecase get depleteNonPlayerHungerUsecase =>
      DepleteNonPlayerHungerUsecase(
        statsRepository:
            _ref.read(personRepositoriesProvider).statsRepositoryImpl,
      );

  EatUsecase get eatUsecase => EatUsecase(
        _ref.read(personRepositoriesProvider).statsRepositoryImpl,
        updateHungerStatsUsecase,
        _ref.read(journalUsecasesProvider),
      );

  QuickEatUsecase get quickEatUsecase => QuickEatUsecase(
        _ref.read(personRepositoriesProvider).statsRepositoryImpl,
        eatUsecase,
      );

  SleepUsecase get sleepUsecase => SleepUsecase(
        updateEnergyStatsUsecase,
        _ref.read(personRepositoriesProvider).statsRepositoryImpl,
        _ref.read(journalUsecasesProvider),
      );

  MakeNonPlayerHungryUsecase get makeNonPlayerHungryUsecase =>
      MakeNonPlayerHungryUsecase(
        statsRepository:
            _ref.read(personRepositoriesProvider).statsRepositoryImpl,
      );

  UpdatePersonUsecase get updatePersonUsecase => UpdatePersonUsecase(
        personRepository:
            _ref.read(personRepositoriesProvider).personRepositoryImpl,
      );

  DeletePersonUsecase get deletePersonUsecase => DeletePersonUsecase(
        personRepository:
            _ref.read(personRepositoriesProvider).personRepositoryImpl,
      );

  GetPersonStatsUsecase get getPersonStatsUsecase => GetPersonStatsUsecase(
      statsRepository:
          _ref.read(personRepositoriesProvider).statsRepositoryImpl);

  GetPersonUsecase get getPersonUsecase => GetPersonUsecase(
      personRepository:
          _ref.read(personRepositoriesProvider).personRepositoryImpl);

  GetPlayerMoneyUsecase get getPlayerMoneyUsecase => GetPlayerMoneyUsecase(
        personRepositories: _ref.read(personRepositoriesProvider),
        relationshipUsecases: _ref.read(relationshipUsecasesProvider),
      );

  TakeMoneyFromPlayerUsecase get takeMoneyFromPlayerUsecase =>
      TakeMoneyFromPlayerUsecase(
        personRepositories: _ref.read(personRepositoriesProvider),
        relationshipUsecases: _ref.read(relationshipUsecasesProvider),
      );

  AddMoneyToPlayerUsecase get addMoneyToPlayerUsecase =>
      AddMoneyToPlayerUsecase(
        personRepositories: _ref.read(personRepositoriesProvider),
        relationshipUsecases: _ref.read(relationshipUsecasesProvider),
      );

  UpdateStatsUsecase get updateStatsUsecase => UpdateStatsUsecase(
        updateEnergyStatsUsecase,
        updateHealthStatsUsecase,
        updateMoodStatsUsecase,
        updateHungerStatsUsecase,
        updateIntellectStatsUsecase,
        updateSoberStatsUsecase,
        updateLooksStatsUsecase,
        updateAthleticismStatsUsecase,
      );

  UpdateMoodStatsUsecase get updateMoodStatsUsecase => UpdateMoodStatsUsecase(
        statsRepository:
            _ref.read(personRepositoriesProvider).statsRepositoryImpl,
        toggleDepleteStatsFlagUsecase: toggleDepleteStatsFlagUsecase,
      );

  UpdateHealthStatsUsecase get updateHealthStatsUsecase =>
      UpdateHealthStatsUsecase(
        statsRepository:
            _ref.read(personRepositoriesProvider).statsRepositoryImpl,
        toggleDepleteStatsFlagUsecase: toggleDepleteStatsFlagUsecase,
      );

  UpdateHungerStatsUsecase get updateHungerStatsUsecase =>
      UpdateHungerStatsUsecase(
        statsRepository:
            _ref.read(personRepositoriesProvider).statsRepositoryImpl,
        toggleDepleteStatsFlagUsecase: toggleDepleteStatsFlagUsecase,
      );

  UpdateEnergyStatsUsecase get updateEnergyStatsUsecase =>
      UpdateEnergyStatsUsecase(
        statsRepository:
            _ref.read(personRepositoriesProvider).statsRepositoryImpl,
        toggleDepleteStatsFlagUsecase: toggleDepleteStatsFlagUsecase,
      );

  UpdateLooksStatsUsecase get updateLooksStatsUsecase =>
      UpdateLooksStatsUsecase(
        statsRepository:
            _ref.read(personRepositoriesProvider).statsRepositoryImpl,
      );

  UpdateSoberStatsUsecase get updateSoberStatsUsecase =>
      UpdateSoberStatsUsecase(
        statsRepository:
            _ref.read(personRepositoriesProvider).statsRepositoryImpl,
        toggleDepleteStatsFlagUsecase: toggleDepleteStatsFlagUsecase,
      );

  UpdateIntellectStatsUsecase get updateIntellectStatsUsecase =>
      UpdateIntellectStatsUsecase(
        statsRepository:
            _ref.read(personRepositoriesProvider).statsRepositoryImpl,
      );

  UpdateAthleticismStatsUsecase get updateAthleticismStatsUsecase =>
      UpdateAthleticismStatsUsecase(
        statsRepository:
            _ref.read(personRepositoriesProvider).statsRepositoryImpl,
        toggleDepleteStatsFlagUsecase: toggleDepleteStatsFlagUsecase,
      );

  CheckIfPlayerCanAffordItUsecase get checkIfPlayerCanAffordItUsecase =>
      CheckIfPlayerCanAffordItUsecase(
        getPlayerMoneyUsecase: getPlayerMoneyUsecase,
        personRepository:
            _ref.read(personRepositoriesProvider).personRepositoryImpl,
      );

  WatchPersonUsecase get watchPersonUsecase => WatchPersonUsecase(
        personRepository:
            _ref.read(personRepositoriesProvider).personRepositoryImpl,
      );

  WatchPersonStatsUsecase get watchPersonStatsUsecase =>
      WatchPersonStatsUsecase(
        statsRepository:
            _ref.read(personRepositoriesProvider).statsRepositoryImpl,
      );

  GetPlayerInformationFromDataUsecase get getPlayerInformationFromDataUsecase =>
      GetPlayerInformationFromDataUsecase(
        _ref.read(ageUsecasesProvider),
        _ref.read(jobUsecasesProvider),
      );

  GetPersonDepleteStatsFlagUsecase get getPersonDepleteStatsFlagUsecase =>
      GetPersonDepleteStatsFlagUsecase(
        depleteStatsFlagRepository: _ref
            .read(personRepositoriesProvider)
            .depleteStatsFlagRepositoryImpl,
      );

  CreateOrUpdateDepleteStatsFlagUsecase
      get createOrUpdateDepleteStatsFlagUsecase =>
          CreateOrUpdateDepleteStatsFlagUsecase(
            depleteStatsFlagRepository: _ref
                .read(personRepositoriesProvider)
                .depleteStatsFlagRepositoryImpl,
          );

  DeletePersonDepleteStatsFlagUsecase get deletePersonDepleteStatsFlagUsecase =>
      DeletePersonDepleteStatsFlagUsecase(
        depleteStatsFlagRepository: _ref
            .read(personRepositoriesProvider)
            .depleteStatsFlagRepositoryImpl,
      );

  ToggleDepleteStatsFlagUsecase get toggleDepleteStatsFlagUsecase =>
      ToggleDepleteStatsFlagUsecase(
        depleteStatsFlagRepository: _ref
            .read(personRepositoriesProvider)
            .depleteStatsFlagRepositoryImpl,
      );

  ResetDepleteStatsFlagUsecase get resetDepleteStatsFlagUsecase =>
      ResetDepleteStatsFlagUsecase(
        depleteStatsFlagRepository: _ref
            .read(personRepositoriesProvider)
            .depleteStatsFlagRepositoryImpl,
      );

  EnergyAndHungerEmergencyModeSideEffectUsecase
      get energyAndHungerEmergencyModeSideEffectUsecase =>
          EnergyAndHungerEmergencyModeSideEffectUsecase(
            statsRepository:
                _ref.read(personRepositoriesProvider).statsRepositoryImpl,
          );

  CreateOrUpdateDeathRecordUsecase get createOrUpdateDeathRecordUsecase =>
      CreateOrUpdateDeathRecordUsecase(
        _ref.read(personRepositoriesProvider).deathRecordRepositoryImpl,
      );

  GetDeathRecordUsecase get getDeathRecordUsecase => GetDeathRecordUsecase(
        _ref.read(personRepositoriesProvider).deathRecordRepositoryImpl,
      );

  GetLivingPeopleInSpecificLifeStageUsecase
      get getLivingPeopleInSpecificLifeStageUsecase =>
          GetLivingPeopleInSpecificLifeStageUsecase(
            _ref.read(ageUsecasesProvider),
            _ref.read(personRepositoriesProvider).personRepositoryImpl,
          );

  GetLivingPeopleInSpecificLifeStageAndCountryUsecase
      get getLivingPeopleInSpecificLifeStageAndCountryUsecase =>
          GetLivingPeopleInSpecificLifeStageAndCountryUsecase(
            _ref.read(ageUsecasesProvider),
            _ref.read(personRepositoriesProvider).personRepositoryImpl,
          );
}
