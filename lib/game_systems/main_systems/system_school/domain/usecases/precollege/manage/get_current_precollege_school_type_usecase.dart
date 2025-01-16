import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_age/age.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_school/constants/school_type.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/model/info_models/precollege_school_type_lifestage_pair.dart';
import 'package:toplife/game_systems/main_systems/system_school/util/get_precollege_school_type_for_lifestage.dart';

class GetCurrentPrecollegeSchoolTypeUsecase {
  final PersonUsecases _personUsecases;
  final AgeUsecases _ageUsecases;

  const GetCurrentPrecollegeSchoolTypeUsecase(
    this._personUsecases,
    this._ageUsecases,
  );

  Future<PrecollegeSchoolTypeLifeStagePair?> execute({
    required int personID,
    required int currentDay,
  }) async {
    //get person info
    final Person? person = await _personUsecases.getPersonUsecase.execute(
      personID: personID,
    );

    //if we have a valid person
    if (person != null) {
      //get the person age
      final Age personAge = _ageUsecases.getPersonsAgeUsecase.execute(
        currentDay: currentDay,
        dayOfBirth: person.dayOfBirth,
      );

      //get the precollege school type
      final SchoolType? precollegeSchoolType =
          getPrecollegeSchoolTypeForLifeStage(
        lifeStage: personAge.lifeStage,
      );

      //if valid, return the precollege school type and the current lifestage
      if (precollegeSchoolType != null) {
        return PrecollegeSchoolTypeLifeStagePair(
          schoolType: precollegeSchoolType,
          lifeStage: personAge.lifeStage,
        );
      }
    }

    return null;
  }
}
