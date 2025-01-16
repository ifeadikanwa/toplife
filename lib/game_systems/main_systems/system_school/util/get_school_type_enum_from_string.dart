import 'package:toplife/game_systems/main_systems/system_school/constants/school_type.dart';

SchoolType? getSchoolTypeEnumFromString({
  required String schoolTypeString,
}) {
  //map to use for conversion
  final Map<String, SchoolType> schoolTypeEnumsMap =
      SchoolType.values.asNameMap();

  return schoolTypeEnumsMap[schoolTypeString];
}
