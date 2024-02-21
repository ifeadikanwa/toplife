import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/repository/person_repository.dart';

class GetLivingPeopleInSpecificLifeStageUsecase {
  final AgeUsecases _ageUsecases;
  final PersonRepository _personRepository;

  const GetLivingPeopleInSpecificLifeStageUsecase(
    this._ageUsecases,
    this._personRepository,
  );

  Future<List<Person>> execute({
    required int currentDay,
    required LifeStage lifeStage,
  }) async {
    //get day of birth range for the lifestage
    final StatsRange dayOfBirthRange =
        _ageUsecases.getCurrentDayOfBirthRangeForALifeStageUsecase.execute(
      currentDay: currentDay,
      lifeStage: lifeStage,
    );

    //get people
    final List<Person> livingPeopleInLifeStage =
        await _personRepository.getLivingPeopleInASpecifiedAgeRange(
      minDayOfBirth: dayOfBirthRange.min,
      maxDayOfBirth: dayOfBirthRange.max,
    );

    return livingPeopleInLifeStage;
  }
}
