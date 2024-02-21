import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_age/age.dart';
import 'package:toplife/main_systems/system_age/usecases/get_persons_age_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';

class GetLastDayOfLifeStageUsecase {
  final PersonUsecases _personUsecases;
  final GetPersonsAgeUsecase _getPersonsAgeUsecase;

  const GetLastDayOfLifeStageUsecase(
    this._personUsecases,
    this._getPersonsAgeUsecase,
  );

  Future<int> execute({
    required int currentDay,
    required int personID,
  }) async {
    //get person
    final Person? person = await _personUsecases.getPersonUsecase.execute(
      personID: personID,
    );

    //if we have a valid person
    if (person != null) {
      //get person age
      final Age personAge = _getPersonsAgeUsecase.execute(
        currentDay: currentDay,
        dayOfBirth: person.dayOfBirth,
      );

      //use point in lifestage to find the last day of the lifestage
      final int daysUntilEndOfLifeStage =
          personAge.lifeStage.stageDuration - personAge.pointInStage;

      final int lastDayOfLifeStage = currentDay + daysUntilEndOfLifeStage;

      //return the last day
      return lastDayOfLifeStage;
    }

    //if person is not valid
    return 0;
  }
}
