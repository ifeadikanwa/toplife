import 'dart:math';

import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/core/utils/numbers/get_negative_or_positive_multiplier.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_problem.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_quality.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/settlement.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/car.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/car_repository.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/car/get_car_max_condition.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_car_quality.dart';

class DriveCarUsecase {
  final CarRepository _carRepository;
  final GetCarMaxConditionUsecase _getCarMaxConditionUsecase;

  const DriveCarUsecase(
    this._carRepository,
    this._getCarMaxConditionUsecase,
  );

  Future<void> execute({
    required Car car,
    required Settlement settlement,
    required int currentDay,
  }) async {
    //reduce fuel
    //reduce condition
    //spin the wheel on generating a problem

    final CarQuality carQuality = getCarQuality(car.quality) ?? CarQuality.low;

    //maxDep + or - (0->4)
    final int newUseCondition = car.useCondition -
        (carQuality.maxDepreciation +
            (getNegativeOrPositiveMultiplier() * Random().nextInt(4)).toInt());

    //fuelConsumption + or - (0->4)
    final newFuelTank = car.fuelTank -
        (settlement.defaultCommuteFuelConsumption +
            (getNegativeOrPositiveMultiplier() * Random().nextInt(4)).toInt());

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
    _carRepository.updateCar(
      car.copyWith(
        useCondition: newUseCondition,
        fuelTank: newFuelTank,
        problem: newCarProblem.name,
      ),
    );
  }
}
