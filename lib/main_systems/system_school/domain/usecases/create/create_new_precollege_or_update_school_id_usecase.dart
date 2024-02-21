import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_school/constants/school_type.dart';
import 'package:toplife/main_systems/system_school/domain/repository/precollege_repository.dart';
import 'package:toplife/main_systems/system_school/util/get_school_type_enum_from_string.dart';

class CreateNewPrecollegeOrUpdateSchoolIdUsecase {
  final PrecollegeRepository _precollegeRepository;

  const CreateNewPrecollegeOrUpdateSchoolIdUsecase(this._precollegeRepository);

  Future<Precollege> execute({required Precollege precollege}) async {
    //we look for an existing precollege record for the school type first
    //we don't want to override an existing record

    final SchoolType? precollegeSchoolType = getSchoolTypeEnumFromString(
      schoolTypeString: precollege.schoolType,
    );

    if (precollegeSchoolType != null) {
      final Precollege? existingPrecollege =
          await _precollegeRepository.getPrecollege(
        precollege.personId,
        precollegeSchoolType,
      );

      //if a match was found
      if (existingPrecollege != null) {
        //update the current school id
        final updatedExistingPrecollege = existingPrecollege.copyWith(
          currentSchoolId: precollege.currentSchoolId,
        );

        //update the existing precollege
        await _precollegeRepository.updatePrecollege(
          updatedExistingPrecollege,
        );

        //return the updated existing precollege
        return updatedExistingPrecollege;
      } else {
        //create the precollege and return it
        final Precollege createdPrecollege =
            await _precollegeRepository.createPrecollege(
          precollege,
        );

        return createdPrecollege;
      }
    }

    //return what was passed in
    return precollege;
  }
}
