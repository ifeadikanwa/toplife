import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/data/repository/person_repositories.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/get/get_person_deplete_stats_flag_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/get/get_player_information_from_data_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_deplete_stats_flag/create_or_update_deplete_stats_flag_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_deplete_stats_flag/delete_person_deplete_stats_flag_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_deplete_stats_flag/reset_deplete_stats_flag_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_deplete_stats_flag/toggle_deplete_stats_flag_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_money/add_money_to_player_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_money/check_if_player_can_afford_it_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_person/create_adult_person_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_person/create_child_person_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_person/delete_person_usecase.dart';
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
  final PersonRepositories _personRepositories;
  final AgeUsecases _ageUsecases;
  final JournalUsecases _journalUsecases;

  const PersonUsecases({
    required PersonRepositories personRepositories,
    required AgeUsecases ageUsecases,
    required JournalUsecases journalUsecases,
  })  : _personRepositories = personRepositories,
        _ageUsecases = ageUsecases,
        _journalUsecases = journalUsecases;

  GenerateAPersonUsecase get generateAPersonUsecase =>
      GenerateAPersonUsecase(ageUsecases: _ageUsecases);

  GenerateListOfPersonUsecase get generateListOfPersonUsecase =>
      GenerateListOfPersonUsecase(
        generateAPersonUsecase: generateAPersonUsecase,
      );

  CreateAdultPersonUsecase get createAdultPersonUsecase =>
      CreateAdultPersonUsecase(
        personRepository: _personRepositories.personRepositoryImpl,
        statsRepository: _personRepositories.statsRepositoryImpl,
        relationshipTraitsRepository:
            _personRepositories.relationshipTraitsRepositoryImpl,
        stanceRepositoryImpl: _personRepositories.stanceRepositoryImpl,
      );

  CreateChildPersonUsecase get createChildPersonUsecase =>
      CreateChildPersonUsecase(
        personRepository: _personRepositories.personRepositoryImpl,
        statsRepository: _personRepositories.statsRepositoryImpl,
        relationshipTraitsRepository:
            _personRepositories.relationshipTraitsRepositoryImpl,
        babyTraitsRepository: _personRepositories.babyTraitsRepositoryImpl,
        stanceRepositoryImpl: _personRepositories.stanceRepositoryImpl,
      );

  DepleteBabyEnergyUsecase get depleteBabyEnergyUsecase =>
      DepleteBabyEnergyUsecase(
        statsRepository: _personRepositories.statsRepositoryImpl,
      );

  DepleteBabyHungerUsecase get depleteBabyHungerUsecase =>
      DepleteBabyHungerUsecase(
        statsRepository: _personRepositories.statsRepositoryImpl,
        babyTraitsRepository: _personRepositories.babyTraitsRepositoryImpl,
      );

  DepleteMainPlayerEnergyUsecase get depleteMainPlayerEnergyUsecase =>
      DepleteMainPlayerEnergyUsecase(
        statsRepository: _personRepositories.statsRepositoryImpl,
        energyAndHungerEmergencyModeSideEffectUsecase:
            energyAndHungerEmergencyModeSideEffectUsecase,
      );

  DepleteMainPlayerHungerUsecase get depleteMainPlayerHungerUsecase =>
      DepleteMainPlayerHungerUsecase(
        statsRepository: _personRepositories.statsRepositoryImpl,
        energyAndHungerEmergencyModeSideEffectUsecase:
            energyAndHungerEmergencyModeSideEffectUsecase,
      );

  DepleteMainPlayerHealthUsecase get depleteMainPlayerHealthUsecase =>
      DepleteMainPlayerHealthUsecase(
        statsRepository: _personRepositories.statsRepositoryImpl,
      );

  DepleteMainPlayerMoodUsecase get depleteMainPlayerMoodUsecase =>
      DepleteMainPlayerMoodUsecase(
        statsRepository: _personRepositories.statsRepositoryImpl,
      );

  DepleteMainPlayerAthleticismUsecase get depleteMainPlayerAthleticismUsecase =>
      DepleteMainPlayerAthleticismUsecase(
        statsRepository: _personRepositories.statsRepositoryImpl,
      );

  IncreaseMainPlayerSobernessUsecase get increaseMainPlayerSobernessUsecase =>
      IncreaseMainPlayerSobernessUsecase(
        statsRepository: _personRepositories.statsRepositoryImpl,
      );

  DepleteNonPlayerHungerUsecase get depleteNonPlayerHungerUsecase =>
      DepleteNonPlayerHungerUsecase(
        statsRepository: _personRepositories.statsRepositoryImpl,
      );

  EatUsecase get eatUsecase => EatUsecase(
        _personRepositories.statsRepositoryImpl,
        updateHungerStatsUsecase,
        _journalUsecases,
      );

  QuickEatUsecase get quickEatUsecase => QuickEatUsecase(
        _personRepositories.statsRepositoryImpl,
        eatUsecase,
      );

  SleepUsecase get sleepUsecase => SleepUsecase(
        updateEnergyStatsUsecase,
        _personRepositories.statsRepositoryImpl,
        _journalUsecases,
      );

  MakeNonPlayerHungryUsecase get makeNonPlayerHungryUsecase =>
      MakeNonPlayerHungryUsecase(
        statsRepository: _personRepositories.statsRepositoryImpl,
      );

  UpdatePersonUsecase get updatePersonUsecase => UpdatePersonUsecase(
        personRepository: _personRepositories.personRepositoryImpl,
      );

  DeletePersonUsecase get deletePersonUsecase => DeletePersonUsecase(
        personRepository: _personRepositories.personRepositoryImpl,
      );

  GetPersonStatsUsecase get getPersonStatsUsecase => GetPersonStatsUsecase(
      statsRepository: _personRepositories.statsRepositoryImpl);

  GetPersonUsecase get getPersonUsecase => GetPersonUsecase(
      personRepository: _personRepositories.personRepositoryImpl);

  GetPlayerMoneyUsecase get getPlayerMoneyUsecase => GetPlayerMoneyUsecase(
        personRepositories: _personRepositories,
      );

  TakeMoneyFromPlayerUsecase get takeMoneyFromPlayerUsecase =>
      TakeMoneyFromPlayerUsecase(
        personRepositories: _personRepositories,
      );

  AddMoneyToPlayerUsecase get addMoneyToPlayerUsecase =>
      AddMoneyToPlayerUsecase(
        personRepositories: _personRepositories,
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
        statsRepository: _personRepositories.statsRepositoryImpl,
        toggleDepleteStatsFlagUsecase: toggleDepleteStatsFlagUsecase,
      );

  UpdateHealthStatsUsecase get updateHealthStatsUsecase =>
      UpdateHealthStatsUsecase(
        statsRepository: _personRepositories.statsRepositoryImpl,
        toggleDepleteStatsFlagUsecase: toggleDepleteStatsFlagUsecase,
      );

  UpdateHungerStatsUsecase get updateHungerStatsUsecase =>
      UpdateHungerStatsUsecase(
        statsRepository: _personRepositories.statsRepositoryImpl,
        toggleDepleteStatsFlagUsecase: toggleDepleteStatsFlagUsecase,
      );

  UpdateEnergyStatsUsecase get updateEnergyStatsUsecase =>
      UpdateEnergyStatsUsecase(
        statsRepository: _personRepositories.statsRepositoryImpl,
        toggleDepleteStatsFlagUsecase: toggleDepleteStatsFlagUsecase,
      );

  UpdateLooksStatsUsecase get updateLooksStatsUsecase =>
      UpdateLooksStatsUsecase(
        statsRepository: _personRepositories.statsRepositoryImpl,
      );

  UpdateSoberStatsUsecase get updateSoberStatsUsecase =>
      UpdateSoberStatsUsecase(
        statsRepository: _personRepositories.statsRepositoryImpl,
        toggleDepleteStatsFlagUsecase: toggleDepleteStatsFlagUsecase,
      );

  UpdateIntellectStatsUsecase get updateIntellectStatsUsecase =>
      UpdateIntellectStatsUsecase(
        statsRepository: _personRepositories.statsRepositoryImpl,
      );

  UpdateAthleticismStatsUsecase get updateAthleticismStatsUsecase =>
      UpdateAthleticismStatsUsecase(
        statsRepository: _personRepositories.statsRepositoryImpl,
        toggleDepleteStatsFlagUsecase: toggleDepleteStatsFlagUsecase,
      );

  CheckIfPlayerCanAffordItUsecase get checkIfPlayerCanAffordItUsecase =>
      CheckIfPlayerCanAffordItUsecase(
        getPlayerMoneyUsecase: getPlayerMoneyUsecase,
      );

  WatchPersonUsecase get watchPersonUsecase => WatchPersonUsecase(
        personRepository: _personRepositories.personRepositoryImpl,
      );

  WatchPersonStatsUsecase get watchPersonStatsUsecase =>
      WatchPersonStatsUsecase(
        statsRepository: _personRepositories.statsRepositoryImpl,
      );

  GetPlayerInformationFromDataUsecase get getPlayerInformationFromDataUsecase =>
      GetPlayerInformationFromDataUsecase(
        _ageUsecases,
      );

  GetPersonDepleteStatsFlagUsecase get getPersonDepleteStatsFlagUsecase =>
      GetPersonDepleteStatsFlagUsecase(
        depleteStatsFlagRepository:
            _personRepositories.depleteStatsFlagRepositoryImpl,
      );

  CreateOrUpdateDepleteStatsFlagUsecase
      get createOrUpdateDepleteStatsFlagUsecase =>
          CreateOrUpdateDepleteStatsFlagUsecase(
            depleteStatsFlagRepository:
                _personRepositories.depleteStatsFlagRepositoryImpl,
          );

  DeletePersonDepleteStatsFlagUsecase get deletePersonDepleteStatsFlagUsecase =>
      DeletePersonDepleteStatsFlagUsecase(
        depleteStatsFlagRepository:
            _personRepositories.depleteStatsFlagRepositoryImpl,
      );

  ToggleDepleteStatsFlagUsecase get toggleDepleteStatsFlagUsecase =>
      ToggleDepleteStatsFlagUsecase(
        depleteStatsFlagRepository:
            _personRepositories.depleteStatsFlagRepositoryImpl,
      );

  ResetDepleteStatsFlagUsecase get resetDepleteStatsFlagUsecase =>
      ResetDepleteStatsFlagUsecase(
        depleteStatsFlagRepository:
            _personRepositories.depleteStatsFlagRepositoryImpl,
      );

  EnergyAndHungerEmergencyModeSideEffectUsecase
      get energyAndHungerEmergencyModeSideEffectUsecase =>
          EnergyAndHungerEmergencyModeSideEffectUsecase(
            statsRepository: _personRepositories.statsRepositoryImpl,
          );
}
