import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/car_problem_repository.dart';

class CheckIfCarHasProblemUsecase {
  final CarProblemRepository _carProblemRepository;

  const CheckIfCarHasProblemUsecase(this._carProblemRepository);

  //check if car problems exist with the carID
  Future<bool> execute({
    required int carID,
  }) async {
    final List<CarProblem> carProblems =
        await _carProblemRepository.getAllOfACarsProblems(carID);

    return (carProblems.isNotEmpty) ? true : false;
  }
}
