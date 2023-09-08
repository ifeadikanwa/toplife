import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_quality.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/car/car_generator.dart';

void main() {
  group("Car generator:", () {
    group("Constants:", () {
      test(
        "fluctuation percentage is 10",
        () {
          expect(CarGenerator.fluctuationPercentage, 10);
        },
      );

      test(
        "numberOfCarsToGenerateForEachType is 2",
        () {
          expect(CarGenerator.numberOfCarsToGenerateForEachType, 2);
        },
      );

      test(
        "minUsedCarCondition is 40",
        () {
          expect(CarGenerator.minUsedCarCondition, 40);
        },
      );

      test(
        "maxUsedCarCondition is 70",
        () {
          expect(CarGenerator.maxUsedCarCondition, 70);
        },
      );

      test(
        "travelTimeIncrement is 5",
        () {
          expect(CarGenerator.travelTimeIncrement, 5);
        },
      );
    });

    group("Generate new cars:", () {
      final List<Car> result = CarGenerator.generateNewCars();
      test(
        "generates (6 * numberOfCarsToGenerateForEachType) number of cars",
        () {
          expect(
            result,
            hasLength(6 * CarGenerator.numberOfCarsToGenerateForEachType),
          );
        },
      );
      test(
        "all cars have a max condition of 100",
        () {
          for (var newCar in result) {
            expect(newCar.maxConditionAtPurchase, 100);
          }
        },
      );

      test(
        "all cars have a use condition of 100",
        () {
          for (var newCar in result) {
            expect(newCar.useCondition, 100);
          }
        },
      );

      test(
        "all cars are NOT insured",
        () {
          for (var newCar in result) {
            expect(newCar.isInsured, false);
          }
        },
      );

      test(
        "all cars have insurance cost of 0",
        () {
          for (var newCar in result) {
            expect(newCar.insuranceCost, 0);
          }
        },
      );

      test(
        "cars are sorted in descending order of price",
        () {
          for (int i = 1; i < result.length; i++) {
            expect(
              result[i - 1].basePrice >= result[i].basePrice,
              true,
              reason:
                  "Cause: index $i is greater than index ${i - 1}. \nList: $result",
            );
          }
        },
      );
    });

    group("Generate used cars:", () {
      final List<Car> result = CarGenerator.generateUsedCars();
      test(
        "generates (6 * numberOfCarsToGenerateForEachType) number of cars",
        () {
          expect(
            result,
            hasLength(6 * CarGenerator.numberOfCarsToGenerateForEachType),
          );
        },
      );
      test(
        "all cars have a max condition in the range minUsedCarCondition - maxUsedCarCondition",
        () {
          for (var usedCar in result) {
            expect(
              usedCar.maxConditionAtPurchase,
              inInclusiveRange(
                CarGenerator.minUsedCarCondition,
                CarGenerator.maxUsedCarCondition,
              ),
            );
          }
        },
      );

      test(
        "all cars have a use condition of 100",
        () {
          for (var usedCar in result) {
            expect(usedCar.useCondition, 100);
          }
        },
      );

      test(
        "all cars are NOT insured",
        () {
          for (var usedCar in result) {
            expect(usedCar.isInsured, false);
          }
        },
      );

      test(
        "all cars have insurance cost of 0",
        () {
          for (var usedCar in result) {
            expect(usedCar.insuranceCost, 0);
          }
        },
      );

      test(
        "cars are sorted in descending order of price",
        () {
          for (int i = 1; i < result.length; i++) {
            expect(
              result[i - 1].basePrice >= result[i].basePrice,
              true,
              reason:
                  "Cause: index $i is greater than index ${i - 1}. \nList: $result",
            );
          }
        },
      );
    });

    group("Reduce car quality:", () {
      test(
        "if quality is high, it returns mid or high quality",
        () {
          final String newQuality =
              CarGenerator.reduceCarQuality(CarQuality.high.name);

          expect(
            newQuality,
            isIn([
              CarQuality.mid.name,
              CarQuality.high.name,
            ]),
          );
        },
      );

      test(
        "if quality is mid, it returns low or mid quality",
        () {
          final String newQuality =
              CarGenerator.reduceCarQuality(CarQuality.mid.name);

          expect(
            newQuality,
            isIn([
              CarQuality.low.name,
              CarQuality.mid.name,
            ]),
          );
        },
      );

      test(
        "if quality is low, it returns low quality",
        () {
          final String newQuality =
              CarGenerator.reduceCarQuality(CarQuality.low.name);

          expect(
            newQuality,
            CarQuality.low.name,
          );
        },
      );
    });

    group("Sort Cars In Descending Order Of Price:", () {
      test(
        "returns a list of cars sorted in descending order of price",
        () {
          const Car carTemplate = Car(
            id: 0,
            personId: 3,
            name: "name",
            type: "type",
            percentageOfTravelTime: 80,
            quality: "quality",
            basePrice: 300,
            dayOfPurchase: 0,
            fuelTank: 100,
            useCondition: 100,
            maxConditionAtPurchase: 100,
            currentlyDriving: false,
            fullyPaidFor: true,
            isInsured: true,
            insuranceCost: 0,
            insuranceType: "",
          );

          final List<Car> testList = [
            carTemplate.copyWith(basePrice: 100),
            carTemplate.copyWith(basePrice: 250),
            carTemplate.copyWith(basePrice: 180),
          ];

          final List<Car> result =
              CarGenerator.sortCarsInDescendingOrderOfPrice(testList);

          //starting from the 2nd house, the previous car price should be larger than the current car price
          for (var i = 1; i < result.length; i++) {
            expect(
              result[i - 1].basePrice >= result[i].basePrice,
              true,
              reason:
                  "Cause: index $i is greater than index ${i - 1}. \nList: $result",
            );
          }
        },
      );
    });
  });
}
