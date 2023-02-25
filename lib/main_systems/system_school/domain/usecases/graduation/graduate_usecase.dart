import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_school/constants/grade.dart';
import 'package:toplife/main_systems/system_school/constants/school_type.dart';
import 'package:toplife/main_systems/system_school/data/repository/school_repositories.dart';

class GraduateUsecase {
  final SchoolRepositories _schoolRepositories;

  const GraduateUsecase({required SchoolRepositories schoolRepositories})
      : _schoolRepositories = schoolRepositories;

  Future<String> execute({required School school}) async {
    //get the degree
    //if the grade is higher or equal to C. They are awarded a degree.
    //If the grade is less than C, They are not awarded a degree.

    final Degree? degree = await _schoolRepositories.degreeRepositoryImpl
        .getDegree(school.degreeId);

    if (degree != null) {
      late final String degreeType;

      if (school.schoolType == SchoolType.undergraduateSchool.name) {
        degreeType = " bachelor's";
      } else if (school.schoolType == SchoolType.graduateSchool.name) {
        degreeType = " master's";
      } else if (school.schoolType == SchoolType.doctorateSchool.name) {
        degreeType = " doctorate";
      } else if (school.schoolType == SchoolType.teacherEducationProgram.name) {
        degreeType = " education";
      } else {
        degreeType = "";
      }

      if (school.grades >= Grade.c.lowerBound) {
        final updatedSchool = school.copyWith(
          isActive: false,
          isCompleted: true,
        );

        await _schoolRepositories.schoolRepositoryImpl
            .updateSchool(updatedSchool);

        return "You worked hard and it payed off. You have been awarded a ${degree.branch}$degreeType degree.";
      } else {
        final updatedSchool = school.copyWith(
          isActive: false,
          isCompleted: false,
        );

        await _schoolRepositories.schoolRepositoryImpl
            .updateSchool(updatedSchool);

        return "Unfortunately you have not been awarded a ${degree.branch}$degreeType degree as you did not meet the minumum requirement of a C grade.";
      }
    } else {
      return "";
    }
  }
}
