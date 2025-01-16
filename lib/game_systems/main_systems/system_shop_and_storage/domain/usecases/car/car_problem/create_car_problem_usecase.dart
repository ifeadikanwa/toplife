import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/numbers/fluctuate_number.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/car_problem_type.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/repository/car_problem_repository.dart';

class CreateCarProblemUsecase {
  final CarProblemRepository _carProblemRepository;

  const CreateCarProblemUsecase(this._carProblemRepository);

  //create car problem with fluctuated base price
  Future<CarProblem> execute({
    required Car car,
    required int currentDay,
    required CarProblemType carProblemType,
  }) async {
    return _carProblemRepository.createCarProblem(
      CarProblem(
        carId: car.id,
        type: carProblemType.name,
        basePrice: fluctuateNumber(
          number: carProblemType.basePrice.toDouble(),
          maxPercentage: 20,
          canBeNegativeFluctuation: true,
        ).round(),
        originDay: currentDay,
        fixDay: 0,
        isRevealed: false,
        isResolved: false,
      ),
    );
  }
}
