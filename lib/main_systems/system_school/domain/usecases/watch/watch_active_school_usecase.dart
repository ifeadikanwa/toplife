import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_school/domain/repository/school_repository.dart';

class WatchActiveSchoolUsecase {
  final SchoolRepository _schoolRepository;

  const WatchActiveSchoolUsecase({
    required SchoolRepository schoolRepository,
  }) : _schoolRepository = schoolRepository;

  Stream<School?> execute({required int mainPersonID}) {
    return _schoolRepository.watchActiveSchool(mainPersonID);
  }
}
