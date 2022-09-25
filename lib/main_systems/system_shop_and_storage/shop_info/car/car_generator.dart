import 'dart:math';

import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/core/utils/numbers/flunctuate_number.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_quality.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/car.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/car/cars/cars_list.dart';

class CarGenerator {
  static const flunctuationPercentage = 10;

  static const int numberOfCarsToGenerateForEachType = 2;

  //used car condition range
  static const int minUsedCarCondition = 40;
  static const int maxUsedCarCondition = 70;

  //travel time increment
  static const int travelTimeIncrement = 5;

  static List<Car> generateNewCars() {
    List<Car> unEditedNewCars = [];

    //for every car type get 2 random cars

    unEditedNewCars.addAll(
      CarsList.getShuffledSportsCarsList()
          .take(numberOfCarsToGenerateForEachType),
    );

    unEditedNewCars.addAll(
      CarsList.getShuffledConvertiblesList()
          .take(numberOfCarsToGenerateForEachType),
    );

    unEditedNewCars.addAll(
      CarsList.getShuffledSUVList().take(numberOfCarsToGenerateForEachType),
    );

    unEditedNewCars.addAll(
      CarsList.getShuffledSedansList().take(numberOfCarsToGenerateForEachType),
    );

    unEditedNewCars.addAll(
      CarsList.getShuffledTrucksList().take(numberOfCarsToGenerateForEachType),
    );

    unEditedNewCars.addAll(
      CarsList.getShuffledMinivansList()
          .take(numberOfCarsToGenerateForEachType),
    );

    //*The list to be returned
    List<Car> flunctuatedNewCars = [];

    //flunctuate the base price of all the cars
    for (var car in unEditedNewCars) {
      flunctuatedNewCars.add(
        car.copyWith(
          basePrice: flunctuateNumber(
            number: car.basePrice.toDouble(),
            maxPercentage: flunctuationPercentage,
            canBeNegativeFlunctuation: true,
          ).round(),
        ),
      );
    }

    //sort the list in descending order of base price and return
    return sortCarsInDescendingOrderOfPrice(flunctuatedNewCars);
  }

  static List<Car> generateUsedCars() {
    //*list to be returned
    List<Car> usedCars = [];

    //use the new car generator as a starting point
    final List<Car> newCars = generateNewCars();

    //for every new car, make it used
    for (var newCar in newCars) {
      //generate a random condition
      int maxConditionAtPurchase =
          Random().nextInt(maxUsedCarCondition - minUsedCarCondition) +
              minUsedCarCondition;

      //increase travel time
      //reduce quality
      //reduce condition
      //reduce base price
      usedCars.add(
        newCar.copyWith(
          maxConditionAtPurchase: maxConditionAtPurchase,
          quality: reduceCarQuality(newCar.quality),
          basePrice:
              (newCar.basePrice * (maxConditionAtPurchase / 100)).round(),
          percentageOfTravelTime:
              newCar.percentageOfTravelTime + travelTimeIncrement,
        ),
      );
    }

    return sortCarsInDescendingOrderOfPrice(usedCars);
  }

  static String reduceCarQuality(String carQuality) {
    //there is a 10% chance the quality isn't reduced.
    //It'll be like a lucky find
    final bool reduceQuality = Chance.getTrueOrFalseBasedOnPercentageChance(
      trueChancePercentage: 90,
    );

    //reduce
    if (reduceQuality) {
      if (carQuality == CarQuality.high.name) {
        return CarQuality.mid.name;
      } else {
        return CarQuality.low.name;
      }
    }
    //return same quality
    else {
      return carQuality;
    }
  }

  static List<Car> sortCarsInDescendingOrderOfPrice(List<Car> cars) {
    cars.sort((a, b) => b.basePrice.compareTo(a.basePrice));
    return cars;
  }
}
