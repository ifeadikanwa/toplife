import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_age/life_stage.dart';
import 'package:toplife/game_systems/main_systems/system_school/constants/school_type.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/model/info_models/precollege_info.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/repository/precollege_repository.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/repository/school_repository.dart';

class GetSpecificPrecollegeSchoolUsecase {
  final PrecollegeRepository _precollegeRepository;
  final SchoolRepository _schoolRepository;

  const GetSpecificPrecollegeSchoolUsecase(
    this._precollegeRepository,
    this._schoolRepository,
  );

  Future<PrecollegeInfo?> execute({
    required int personID,
    required SchoolType precollegeSchoolType,
  }) async {
    //get precollege
    final Precollege? precollege = await _precollegeRepository.getPrecollege(
      personID,
      precollegeSchoolType,
    );

    //if a valid precollege was found
    if (precollege != null) {
      //get the school attached
      final School? school = await _schoolRepository.getSchool(
        precollege.currentSchoolId,
      );

      //if we have a valid school attached
      if (school != null) {
        //return the full info
        switch (precollegeSchoolType) {
          case SchoolType.elementarySchool:
            return PrecollegeInfo(
              precollege: precollege,
              school: school,
              schoolType: precollegeSchoolType,
              lifeStage: LifeStage.toddler,
            );

          case SchoolType.middleSchool:
            return PrecollegeInfo(
              precollege: precollege,
              school: school,
              schoolType: precollegeSchoolType,
              lifeStage: LifeStage.child,
            );
          case SchoolType.highSchool:
            return PrecollegeInfo(
              precollege: precollege,
              school: school,
              schoolType: precollegeSchoolType,
              lifeStage: LifeStage.teen,
            );
          default:
            return null;
        }
      }
    }

    //return null, if there is no precollege record for the school type
    return null;
  }
}
