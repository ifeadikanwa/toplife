import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_school/data/repository/school_repositories.dart';
import 'package:toplife/main_systems/system_school/degree_info/degree_discipline.dart';

class GetHighestGradeForAnyCompletedSchoolInADisciplineUsecase {
  final SchoolRepositories _schoolRepositories;

  const GetHighestGradeForAnyCompletedSchoolInADisciplineUsecase({
    required SchoolRepositories schoolRepositories,
  }) : _schoolRepositories = schoolRepositories;

  Future<int> execute({
    required int mainPersonID,
    required DegreeDiscipline degreeDiscipline,
  }) async {
    //take in a discipline
    //grade = 0
    //get all completed schools
    //go through every completed school
    //get the degree
    //if the degree discipline is what we want & the grade of the school is greater than the grade variable,
    //update the grade variable
    //return grade

    int grade = 0;

    List<School> completedSchools = await _schoolRepositories
        .schoolRepositoryImpl
        .getAllCompletedSchool(mainPersonID);

    for (var completedSchool in completedSchools) {
      final degreeRecord = await _schoolRepositories.degreeRepositoryImpl
          .getDegree(completedSchool.degreeId);
      if (degreeRecord != null) {
        if (degreeRecord.discipline == degreeDiscipline.name &&
            completedSchool.grades > grade) {
          grade = completedSchool.grades;
        }
      }
    }

    return grade;
  }
}
