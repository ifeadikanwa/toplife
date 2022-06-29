import 'package:toplife/main_systems/system_school/data/repository/school_repositories.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/create_and_populate_degree_table_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/get_constant_list_of_degrees_usecase.dart';

class SchoolUsecases {
  final SchoolRepositories _schoolRepositories;

  const SchoolUsecases({
    required SchoolRepositories schoolRepositories,
  }) : _schoolRepositories = schoolRepositories;

  GetConstantListOfDegreesUsecase get getConstantListOfDegreesUsecase =>
      const GetConstantListOfDegreesUsecase();
      
  CreateAndPopulateDegreeTableUsecase get createAndPopulateDegreeTableUsecase =>
      CreateAndPopulateDegreeTableUsecase(
        getConstantListOfDegreesUsecase: getConstantListOfDegreesUsecase,
        degreeRepository: _schoolRepositories.degreeRepositoryImpl,
      );
}
