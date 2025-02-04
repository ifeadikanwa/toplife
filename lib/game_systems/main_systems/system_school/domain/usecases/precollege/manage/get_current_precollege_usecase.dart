import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/model/info_models/precollege_info.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/model/info_models/precollege_school_type_lifestage_pair.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/repository/precollege_repository.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/repository/school_repository.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/precollege/manage/get_current_precollege_school_type_usecase.dart';

class GetCurrentPrecollegeUsecase {
  final PrecollegeRepository _precollegeRepository;
  final GetCurrentPrecollegeSchoolTypeUsecase
      _getCurrentPrecollegeSchoolTypeUsecase;
  final SchoolRepository _schoolRepository;

  const GetCurrentPrecollegeUsecase(
    this._precollegeRepository,
    this._getCurrentPrecollegeSchoolTypeUsecase,
    this._schoolRepository,
  );

  Future<PrecollegeInfo?> execute({
    required int personID,
    required int currentDay,
  }) async {
    //get current precollege school type
    final PrecollegeSchoolTypeLifeStagePair?
        currentPrecollegeSchoolTypeAndLifeStage =
        await _getCurrentPrecollegeSchoolTypeUsecase.execute(
      personID: personID,
      currentDay: currentDay,
    );

    //if it is valid
    if (currentPrecollegeSchoolTypeAndLifeStage != null) {
      //get the record for that school type
      final Precollege? currentPrecollege =
          await _precollegeRepository.getPrecollege(
        personID,
        currentPrecollegeSchoolTypeAndLifeStage.schoolType,
      );

      // if valid
      if (currentPrecollege != null) {
        //get the school attached
        final School? school = await _schoolRepository.getSchool(
          currentPrecollege.currentSchoolId,
        );

        //if we have a valid school attached
        if (school != null) {
          return PrecollegeInfo(
            precollege: currentPrecollege,
            school: school,
            schoolType: currentPrecollegeSchoolTypeAndLifeStage.schoolType,
            lifeStage: currentPrecollegeSchoolTypeAndLifeStage.lifeStage,
          );
        }
      }
    }

    return null;
  }
}
