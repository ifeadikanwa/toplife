import 'dart:math';

import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/core/utils/numbers/get_negative_or_positive_multiplier.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_problem.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_quality.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/car_repository.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/car/get_car_max_condition.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_car_quality_enum.dart';

class DriveCarUsecase {
  final CarRepository _carRepository;
  final GetCarMaxConditionUsecase _getCarMaxConditionUsecase;

  const DriveCarUsecase(
    this._carRepository,
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
      chanceOfProblem = 50;
    } else if (maxCondition <= 50) {
      chanceOfProblem = 20;
    } else {
      chanceOfProblem = 10;
    }

    final bool carGetsProblem = Chance.getTrueOrFalseBasedOnPercentageChance(
      trueChancePercentage: chanceOfProblem,
    );

    late final CarProblem newCarProblem;
    if (carGetsProblem) {
      newCarProblem = CarProblem.values[Random().nextInt(
        CarProblem.values.length,
      )];
    } else {
      newCarProblem = CarProblem.noProblem;
    }

    //update car
    await _carRepository.updateCar(
      car.copyWith(
        useCondition: newUseCondition,
        fuelTank: crossCheckStat(newFuelTank),
        problem: newCarProblem.name,
      ),
    );
  }
}
