import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_school/constants/school_info.dart';
import 'package:toplife/main_systems/system_school/constants/school_type.dart';
import 'package:toplife/main_systems/system_school/util/get_precollege_homework_percentage.dart';

void main() {
  group("getPrecollegeHomeworkPercentage: ", () {
    test(
      "given submitted homework greater the required submitted homework, we get the correct result",
      () => expect(
        getPrecollegeHomeworkPercentage(
          submittedHomework:
              SchoolInfo.getRequiredSchoolDays(SchoolType.middleSchool) + 10,
          precollegeSchoolType: SchoolType.middleSchool,
        ),
        100,
      ),
    );

    test(
      "given submitted homework less than 0, we get the correct result",
      () => expect(
        getPrecollegeHomeworkPercentage(
          submittedHomework: -8,
          precollegeSchoolType: SchoolType.middleSchool,
        ),
        0,
      ),
    );

    test(
      "given elementary school, we get the correct result",
      () => expect(
        getPrecollegeHomeworkPercentage(
          submittedHomework: 4,
          precollegeSchoolType: SchoolType.elementarySchool,
        ),
        80,
      ),
    );

    test(
      "given middle school, we get the correct result",
      () => expect(
        getPrecollegeHomeworkPercentage(
          submittedHomework: 7,
          precollegeSchoolType: SchoolType.middleSchool,
        ),
        70,
      ),
    );

    test(
      "given high school, we get the correct result",
      () => expect(
        getPrecollegeHomeworkPercentage(
          submittedHomework: 4,
          precollegeSchoolType: SchoolType.highSchool,
        ),
        27,
      ),
    );

    test(
      "given a non precollege school, we get the correct result",
      () => expect(
        getPrecollegeHomeworkPercentage(
          submittedHomework: 7,
          precollegeSchoolType: SchoolType.undergraduateSchool,
        ),
        0,
      ),
    );
  });
}
