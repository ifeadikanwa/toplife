import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/numbers/get_random_int_in_positive_range.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range_constants.dart';
import 'package:toplife/game_systems/main_systems/system_age/age.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_school/constants/school_tier.dart';
import 'package:toplife/game_systems/main_systems/system_school/constants/school_type.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/model/info_models/school_precollege_info.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/create/create_new_precollege_or_update_school_id_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/create/create_school_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_school/util/generate_precollege_with_no_grade.dart';
import 'package:toplife/game_systems/main_systems/system_school/util/generate_precollege_with_random_grade.dart';
import 'package:toplife/game_systems/main_systems/system_school/util/get_precollege_school_name.dart';
import 'package:toplife/game_systems/main_systems/system_school/util/get_precollege_school_type_for_lifestage.dart';

class CreateStatePrecollegeSchoolAndRegisterPersonUsecase {
  final CreateSchoolUsecase _createSchoolUsecase;
  final PersonUsecases _personUsecases;
  final AgeUsecases _ageUsecases;
  final CreateNewPrecollegeOrUpdateSchoolIdUsecase
      _createNewPrecollegeOrUpdateSchoolIdUsecase;

  const CreateStatePrecollegeSchoolAndRegisterPersonUsecase(
    this._createSchoolUsecase,
    this._personUsecases,
    this._ageUsecases,
    this._createNewPrecollegeOrUpdateSchoolIdUsecase,
  );

  Future<SchoolPrecollegeInfo?> execute({
    required int personID,
    required int currentDay,
    required bool generateRandomGrades,
  }) async {
    //get  person info
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

      final SchoolType? precollegeSchoolType =
          getPrecollegeSchoolTypeForLifeStage(
        lifeStage: personAge.lifeStage,
      );

      //if it is a valid precollege school type
      if (precollegeSchoolType != null) {
        //precollege schools are always named after the state

        //get school name
        final String schoolName = getPrecollegeSchoolName(
          lifeStage: personAge.lifeStage,
          stateString: person.currentState,
          countryString: person.currentCountry,
        );

        //create school if it doesn't exist
        final School createdSchool = await _createSchoolUsecase.execute(
          school: School(
            id: DatabaseConstants.dummyId,
            name: schoolName,
            state: person.currentState,
            country: person.currentCountry,
            tier: SchoolTier.mid.name,
          ),
        );

        //create precollege object
        //for the player we would want a clean slate, for NPCs we want to generate a random grade
        late final Precollege precollege;

        //generate precollege with a random grade using the persons intelligence
        if (generateRandomGrades) {
          //get student stats
          final Stats? studentStats =
              await _personUsecases.getPersonStatsUsecase.execute(
            person.id,
          );

          //get student intelligence, generate a random one if we didn't find a valid stats
          final int studentIntelligence = studentStats?.intellect ??
              getRandomIntInPositiveRange(
                min: StatsRangeConstants.defaultRange.min,
                max: StatsRangeConstants.defaultRange.max,
              );

          precollege = generatePrecollegeWithRandomGrade(
            studentID: person.id,
            precollegeSchoolType: precollegeSchoolType,
            schoolID: createdSchool.id,
            active: true,
            intelligenceStats: studentIntelligence,
          );
        }
        //generate precollege with no grade set
        else {
          precollege = generatePrecollegeWithNoGrade(
            studentID: person.id,
            precollegeSchoolType: precollegeSchoolType,
            schoolID: createdSchool.id,
            active: true,
          );
        }

        //create precollege record for the person if it doesn't exist or just update the school id if a record exists
        await _createNewPrecollegeOrUpdateSchoolIdUsecase.execute(
          precollege: precollege,
        );

        //return the precollege info
        return SchoolPrecollegeInfo(
          school: createdSchool,
          precollegeLifeStage: personAge.lifeStage,
          precollegeSchoolType: precollegeSchoolType,
        );
      }
    }

    return null;
  }
}
