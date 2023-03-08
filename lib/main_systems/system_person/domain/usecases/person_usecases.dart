import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_person/data/repository/person_repositories.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/get/get_player_information_from_data_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_money/add_money_to_player_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_money/check_if_player_can_afford_it_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_person/create_adult_person_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_person/create_child_person_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_person/delete_person_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_survival_stats/deplete_baby_energy_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_survival_stats/deplete_baby_hunger_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_survival_stats/deplete_main_player_energy_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_survival_stats/deplete_main_player_hunger_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_survival_stats/deplete_non_player_hunger_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_survival_stats/eat_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_person/generate_a_person_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_person/generate_list_of_person_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/get/get_person_stats_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/get/get_person_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/get/get_player_money_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_survival_stats/make_non_player_hungry_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_survival_stats/sleep_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_money/take_money_from_player_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/update_general/update_person_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/update_general/update_stats_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/update_specific_stats/update_athleticism_stats_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/update_specific_stats/update_intellect_stats_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/update_specific_stats/update_looks_stats_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/update_specific_stats/update_sober_stats_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/update_specific_stats/update_wellbeing_stats_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/watch/watch_person_stats_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/watch/watch_person_usecase.dart';

class PersonUsecases {
  final PersonRepositories _personRepositories;
  final AgeUsecases _ageUsecases;

  const PersonUsecases({
    required PersonRepositories personRepositories,
    required AgeUsecases ageUsecases,
  })  : _personRepositories = personRepositories,
        _ageUsecases = ageUsecases;

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
      );

  DepleteMainPlayerHungerUsecase get depleteMainPlayerHungerUsecase =>
      DepleteMainPlayerHungerUsecase(
        statsRepository: _personRepositories.statsRepositoryImpl,
      );

  DepleteNonPlayerHungerUsecase get depleteNonPlayerHungerUsecase =>
      DepleteNonPlayerHungerUsecase(
        statsRepository: _personRepositories.statsRepositoryImpl,
      );

  EatUsecase get eatUsecase => EatUsecase(
        statsRepository: _personRepositories.statsRepositoryImpl,
      );

  SleepUsecase get sleepUsecase => SleepUsecase(
        statsRepository: _personRepositories.statsRepositoryImpl,
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
        statsRepository: _personRepositories.statsRepositoryImpl,
      );

  UpdateWellbeingStatsUsecase get updateWellbeingStatsUsecase =>
      UpdateWellbeingStatsUsecase(
        statsRepository: _personRepositories.statsRepositoryImpl,
      );

  UpdateLooksStatsUsecase get updateLooksStatsUsecase =>
      UpdateLooksStatsUsecase(
        statsRepository: _personRepositories.statsRepositoryImpl,
      );

  UpdateSoberStatsUsecase get updateSoberStatsUsecase =>
      UpdateSoberStatsUsecase(
        statsRepository: _personRepositories.statsRepositoryImpl,
      );

  UpdateIntellectStatsUsecase get updateIntellectStatsUsecase =>
      UpdateIntellectStatsUsecase(
        statsRepository: _personRepositories.statsRepositoryImpl,
      );

  UpdateAthleticismStatsUsecase get updateAthleticismStatsUsecase =>
      UpdateAthleticismStatsUsecase(
        statsRepository: _personRepositories.statsRepositoryImpl,
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
}
