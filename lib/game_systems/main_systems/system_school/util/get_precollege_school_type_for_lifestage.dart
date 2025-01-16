import 'package:toplife/game_systems/main_systems/system_age/life_stage.dart';
import 'package:toplife/game_systems/main_systems/system_school/constants/school_type.dart';

SchoolType? getPrecollegeSchoolTypeForLifeStage({
  required LifeStage lifeStage,
}) {
  switch (lifeStage) {
    case LifeStage.toddler:
      return SchoolType.elementarySchool;

    case LifeStage.child:
      return SchoolType.middleSchool;

    case LifeStage.teen:
      return SchoolType.highSchool;

    default:
      return null;
  }
}
