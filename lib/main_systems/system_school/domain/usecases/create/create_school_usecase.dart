import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_school/domain/repository/school_repository.dart';

class CreateSchoolUsecase {
  final SchoolRepository _schoolRepository;

  const CreateSchoolUsecase(this._schoolRepository);

  Future<School> execute({required School school}) async {
    //we look for a matching school first, we don't want duplicates
    final School? existingSchool =
        await _schoolRepository.findSchoolWithNameAndLocation(
      school.name,
      school.state,
      school.country,
    );

    //if a match was found
    if (existingSchool != null) {
      //return the existing school
      return existingSchool;
    } else {
      //create the school and return it
      final School createdSchool = await _schoolRepository.createSchool(
        school,
      );

      return createdSchool;
    }
  }
}
