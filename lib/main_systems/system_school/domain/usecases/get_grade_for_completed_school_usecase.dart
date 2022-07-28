import 'package:toplife/main_systems/system_school/constants/degree_level.dart';
import 'package:toplife/main_systems/system_school/data/repository/school_repositories.dart';

class GetGradeForCompletedSchoolUsecase {
  final SchoolRepositories _schoolRepositories;

  const GetGradeForCompletedSchoolUsecase({
    required SchoolRepositories schoolRepositories,
  }) : _schoolRepositories = schoolRepositories;

  Future<int> execute(
      int mainPersonID, int degreeID, DegreeLevel degreeLevel) async {
    //take in a degree id, degree level,
    //get completed school for that degree id and degree level
    //if it is null return 0
    //else return the grade

    final completedSchool = await _schoolRepositories.schoolRepositoryImpl
        .getCompletedSchoolForADegreeAtADegreeLevel(
      mainPersonID,
      degreeID,
      degreeLevel,
    );

    if (completedSchool != null) {
      return completedSchool.grades;
    } else {
      return 0;
    }
  }
}
