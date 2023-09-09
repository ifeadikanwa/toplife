import 'dart:math';

import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/core/utils/get_random_value_from_collections.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_problem_type.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/car_repository.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/car/car_problem/create_car_problem_usecase.dart';

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
    //add car to storage with important information added
    final Car purchasedCar = await _carRepository.createCar(
      car.copyWith(
        personId: personID,
        dayOfPurchase: dayOfPurchase,
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
