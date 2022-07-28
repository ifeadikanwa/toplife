import 'package:toplife/main_systems/system_school/data/repository/school_repositories.dart';
import 'package:toplife/main_systems/system_school/domain/model/school.dart';

class EndAllActiveSchoolProgramsUsecase {
  final SchoolRepositories _schoolRepositories;

  const EndAllActiveSchoolProgramsUsecase(
      {required SchoolRepositories schoolRepositories})
      : _schoolRepositories = schoolRepositories;

  Future<void> execute({required int mainPersonID}) async {
    //get all active school programs.
    //update them to inactive and incomplete

    List<School> activeSchools = await _schoolRepositories.schoolRepositoryImpl
        .getAllActiveSchools(mainPersonID);

    for (var activeSchool in activeSchools) {
      final School updatedSchool = activeSchool.copyWith(
        isActive: false,
        isCompleted: false,
      );

      await _schoolRepositories.schoolRepositoryImpl.updateSchool(updatedSchool);
    }
  }
}
