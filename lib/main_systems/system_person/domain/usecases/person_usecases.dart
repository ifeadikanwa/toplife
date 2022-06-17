import 'package:toplife/main_systems/system_person/data/repository/person_repositories.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/create_adult_person_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/create_child_person_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/delete_person_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/deplete_baby_energy_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/deplete_baby_hunger_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/deplete_main_player_energy_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/deplete_main_player_hunger_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/deplete_non_player_hunger_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/eat_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/generate_a_person_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/generate_list_of_person_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/make_non_player_hungry_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/sleep_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/update_person_usecase.dart';

class PersonUsecases {
  final PersonRepositories _personRepositories;

  const PersonUsecases({required PersonRepositories personRepositories})
      : _personRepositories = personRepositories;

  GenerateAPersonUsecase get generateAPersonUsecase => GenerateAPersonUsecase();

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
      );

  CreateChildPersonUsecase get createChildPersonUsecase =>
      CreateChildPersonUsecase(
        personRepository: _personRepositories.personRepositoryImpl,
        statsRepository: _personRepositories.statsRepositoryImpl,
        relationshipTraitsRepository:
            _personRepositories.relationshipTraitsRepositoryImpl,
        babyTraitsRepository: _personRepositories.babyTraitsRepositoryImpl,
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
}
