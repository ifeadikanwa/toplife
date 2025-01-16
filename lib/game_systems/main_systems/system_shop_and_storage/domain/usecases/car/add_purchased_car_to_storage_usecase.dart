import 'dart:math';

import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/core/utils/get_random_value_from_collections.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/car_problem_type.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/repository/car_repository.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/car/car_problem/create_car_problem_usecase.dart';

class AddPurchasedCarToStorageUsecase {
  final CarRepository _carRepository;
  final CreateCarProblemUsecase _createCarProblemUsecase;

  const AddPurchasedCarToStorageUsecase(
    this._carRepository,
    this._createCarProblemUsecase,
  );

  Future<Car> execute({
    required Car car,
    required int personID,
    required int dayOfPurchase,
    required bool fullyPaidFor,
  }) async {
    //-Depreciation fluctuator
    //pick a random number between 0 - 5 to fluctuate car depreciation
    final int chosenFluctuator = Random().nextInt(6);

    //-Last known Condition
    //this is equal to the condition at purchase
    final int lastKnownCondition = car.maxConditionAtPurchase;

    //-Last know maintenance day
    //this is going to be the day of purchase
    final int lastKnownMaintenanceDay = dayOfPurchase;

    //-Add car
    //add car to storage with overrided important information
    final Car purchasedCar = await _carRepository.createCar(
      car.copyWith(
        personId: personID,
        dayOfPurchase: dayOfPurchase,
        depreciationFluctuator: chosenFluctuator,
        lastKnownCondition: lastKnownCondition,
        lastMaintenanceDay: lastKnownMaintenanceDay,
        fullyPaidFor: fullyPaidFor,
      ),
    );

    //-Car Problems
    //check if the car is used
    if (purchasedCar.maxConditionAtPurchase != defaultMaxStatsValue) {
      //if the car is used, there is a 5% chance it comes with problems
      final bool carHasProblems = Chance.getTrueOrFalseBasedOnPercentageChance(
        trueChancePercentage: 5,
      );

      if (carHasProblems) {
        //pick a random number of problems between 1 - 3
        final int totalNumberOfProblems = Random().nextInt(3) + 1;

        for (var i = 0; i < totalNumberOfProblems; i++) {
          //choose a random problem type
          final CarProblemType chosenCarProblemType = getRandomValueFromList(
            list: CarProblemType.values,
          );
          //add a problemwith that type
          await _createCarProblemUsecase.execute(
            car: purchasedCar,
            currentDay: dayOfPurchase,
            carProblemType: chosenCarProblemType,
          );
        }
      }
    }

    //return the created car record
    return purchasedCar;
  }
}
