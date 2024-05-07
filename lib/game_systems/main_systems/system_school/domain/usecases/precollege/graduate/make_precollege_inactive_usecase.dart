import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_school/constants/school_type.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/repository/precollege_repository.dart';

class MakePrecollegeInActiveUsecase {
  final PrecollegeRepository _precollegeRepository;

  const MakePrecollegeInActiveUsecase(
    this._precollegeRepository,
  );

  Future<void> execute({
    required int personID,
    required SchoolType precollegeSchoolType,
  }) async {
    //get the precollege record
    final Precollege? precollege = await _precollegeRepository.getPrecollege(
      personID,
      precollegeSchoolType,
    );

    //if it is valid, update it as inactive
    if (precollege != null) {
      await _precollegeRepository.updatePrecollege(
        precollege.copyWith(
          active: false,
        ),
      );
    }
  }
}
