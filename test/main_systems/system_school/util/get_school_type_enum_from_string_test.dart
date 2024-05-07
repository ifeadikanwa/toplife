import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_school/constants/school_type.dart';
import 'package:toplife/game_systems/main_systems/system_school/util/get_school_type_enum_from_string.dart';

void main() {
  group("getSchoolTypeEnumFromString: ", () {
    test(
      "given a valid school type string we get the equivalent school type",
      () => expect(
        getSchoolTypeEnumFromString(schoolTypeString: 'middleSchool'),
        SchoolType.middleSchool,
      ),
    );

    test(
      "given an invalid school type string we get null",
      () => expect(
        getSchoolTypeEnumFromString(schoolTypeString: 'wrong'),
        null,
      ),
    );
  });
}
