import 'dart:math';

import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/core/utils/numbers/get_negative_or_positive_multiplier.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_problem_type.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_quality.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/car_repository.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/car/car_problem/create_car_problem_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/car/get_car_max_condition.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_car_quality_enum.dart';

class DriveCarUsecase {
  final CarRepository _carRepository;
  final CreateCarProblemUsecase _createCarProblemUsecase;
  final GetCarMaxConditionUsecase _getCarMaxConditionUsecase;

  const DriveCarUsecase(
    this._carRepository,
    this._createCarProblemUsecase,
    this._getCarMaxConditionUsecase,
  );

  Future<void> execute({
    required Car car,
    required int currentDay,
    required int fuelConsumption,
  }) async {
    //reduce fuel
    //reduce condition
    //spin the wheel on generating a problem

    final CarQuality carQuality =
        getCarQualityEnum(car.quality) ?? CarQuality.low;

    //maxDep + or - (0->4)
    final int newUseCondition = car.useCondition -
        (carQuality.maxDepreciation +
            (getNegativeOrPositiveMultiplier() * Random().nextInt(4)).toInt());

    //fuelConsumption
    final newFuelTank = car.fuelTank - fuelConsumption;

    final maxCondition = _getCarMaxConditionUsecase.execute(
      car: car,
      currentDay: currentDay,
    );

    //car problem
    late final int chanceOfProblem;

    if (maxCondition <= 20) {
      chanceOfProblem = 25;
    } else if (maxCondition <= 50) {
      chanceOfProblem = 10;
    } else {
      chanceOfProblem = 5;
    }

    final bool carGetsProblem = Chance.getTrueOrFalseBasedOnPercentageChance(
      trueChancePercentage: chanceOfProblem,
    );

    late final CarProblemType newCarProblemType;
    if (carGetsProblem) {
      //choose random problem
      newCarProblemType = CarProblemType.values[Random().nextInt(
        CarProblemType.values.length,
      )];

      //add chosen problem
      await _createCarProblemUsecase.execute(
        car: car,
        currentDay: currentDay,
        carProblemType: newCarProblemType,
      );
    }

    // update car
    await _carRepository.updateCar(
      car.copyWith(
        useCondition: newUseCondition,
        fuelTank: newFuelTank,
      ),
    );
  }
}
