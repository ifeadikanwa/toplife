import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_school/data/repository/school_repositories.dart';

class GetValidListOfDoctorateDegreesUsecase {
  final SchoolRepositories _schoolRepositories;

  const GetValidListOfDoctorateDegreesUsecase(
      {required SchoolRepositories schoolRepositories})
      : _schoolRepositories = schoolRepositories;

  Future<List<Degree>> execute({required int personID}) async {
    //The aim is to provide a list of completed master's degree that you can now get a doctorate for, 
    //but we make sure to remove any master's degree you already have a completed doctorate degree for from that list.

    //get users completed master's school
    //get their completed master school
    //for every master's school remove it's equivalent bachelor school from the list
    //get the degree info of all the remaining bachelor schools degree

    List<School> availableDoctorateSchools = await _schoolRepositories
        .schoolRepositoryImpl
        .getAllCompletedGraduateSchool(personID);

    List<School> completedDoctorateSchools = await _schoolRepositories
        .schoolRepositoryImpl
        .getAllCompletedDoctorateSchool(personID);

    for (var completedDoctorateSchool in completedDoctorateSchools) {
      availableDoctorateSchools.removeWhere(
          (school) => school.degreeId == completedDoctorateSchool.degreeId);
    }

    List<Degree> availableDoctorateDegrees = [];

    for (var availableDoctorateSchool in availableDoctorateSchools) {
      Degree? degree = await _schoolRepositories.degreeRepositoryImpl
          .getDegree(availableDoctorateSchool.degreeId);

      if (degree != null) {
        availableDoctorateDegrees.add(degree);
      }
    }

    return availableDoctorateDegrees;
  }
}
