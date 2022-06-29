import 'package:toplife/main_systems/system_school/domain/model/degree.dart';
import 'package:toplife/main_systems/system_school/domain/repository/degree_repository.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/get_constant_list_of_degrees_usecase.dart';

class CreateAndPopulateDegreeTableUsecase {
  final GetConstantListOfDegreesUsecase _getConstantListOfDegreesUsecase;
  final DegreeRepository _degreeRepository;

  const CreateAndPopulateDegreeTableUsecase({
    required GetConstantListOfDegreesUsecase getConstantListOfDegreesUsecase,
    required DegreeRepository degreeRepository,
  })  : _getConstantListOfDegreesUsecase = getConstantListOfDegreesUsecase,
        _degreeRepository = degreeRepository;

  Future<void> execute() async {
    //get the list of degrees
    //drop and recreate the table
    //batch insert all the degrees

    final Set<Degree> degrees = _getConstantListOfDegreesUsecase.execute();

    await _degreeRepository.dropAndRecreateDegreeTable();
    await _degreeRepository.batchInsertDegrees(degrees);
  }
}
