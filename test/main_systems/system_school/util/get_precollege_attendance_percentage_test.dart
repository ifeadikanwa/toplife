import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_school/constants/school_info.dart';
import 'package:toplife/main_systems/system_school/constants/school_type.dart';
import 'package:toplife/main_systems/system_school/util/get_precollege_attendance_percentage.dart';

void main() {
  group("getPrecollegeAttendancePercentage: ", () {
    test(
      "given attendance days greater the required attendance days, we get the correct result",
      () => expect(
        getPrecollegeAttendancePercentage(
          attendanceDays:
              SchoolInfo.getRequiredSchoolDays(SchoolType.middleSchool) + 10,
          precollegeSchoolType: SchoolType.middleSchool,
        ),
        100,
      ),
    );

    test(
      "given attendance days less than 0, we get the correct result",
      () => expect(
        getPrecollegeAttendancePercentage(
          attendanceDays: -8,
          precollegeSchoolType: SchoolType.middleSchool,
        ),
        0,
      ),
    );

    test(
      "given elementary school, we get the correct result",
      () => expect(
        getPrecollegeAttendancePercentage(
          attendanceDays: 4,
          precollegeSchoolType: SchoolType.elementarySchool,
        ),
        80,
      ),
    );

    test(
      "given middle school, we get the correct result",
      () => expect(
        getPrecollegeAttendancePercentage(
          attendanceDays: 7,
          precollegeSchoolType: SchoolType.middleSchool,
        ),
        70,
      ),
    );

    test(
      "given high school, we get the correct result",
      () => expect(
        getPrecollegeAttendancePercentage(
          attendanceDays: 4,
          precollegeSchoolType: SchoolType.highSchool,
        ),
        27,
      ),
    );

    test(
      "given a non precollege school, we get the correct result",
      () => expect(
        getPrecollegeAttendancePercentage(
          attendanceDays: 7,
          precollegeSchoolType: SchoolType.undergraduateSchool,
        ),
        0,
      ),
    );
  });
}
