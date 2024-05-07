import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/car_quality.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/car_type.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/shop_info/car/cars/trucks.dart';

void main() {
  group("Trucks:", () {
    test(
      "every car name is at least 5 letters",
      () {
        for (var truck in trucks) {
          expect(
            truck.name.trim().length,
            greaterThanOrEqualTo(5),
            reason: "Cause: $truck",
          );
        }
      },
    );

    test(
      "there are at least 7 cars in the list",
      () {
        expect(trucks.length, greaterThanOrEqualTo(7));
      },
    );

    test(
      "every car type is a truck",
      () {
        for (var truck in trucks) {
          expect(
            truck.type,
            CarType.truck.name,
            reason: "Cause: ${truck.name}",
          );
        }
      },
    );

    test(
      "every car percentage travel time is greater than 0",
      () {
        for (var truck in trucks) {
          expect(
            truck.percentageOfTravelTime,
            greaterThan(0),
            reason: "Cause: ${truck.name}",
          );
        }
      },
    );

    test(
      "every car percentage travel time is in the range 60 - 70",
      () {
        for (var truck in trucks) {
          expect(
            truck.percentageOfTravelTime,
            inInclusiveRange(60, 70),
            reason: "Cause: ${truck.name}",
          );
        }
      },
    );

    test(
      "every car quality is low, mid or high",
      () {
        for (var truck in trucks) {
          expect(
            truck.quality,
            isIn([
              CarQuality.high.name,
              CarQuality.mid.name,
              CarQuality.low.name,
            ]),
            reason: "Cause: ${truck.name}",
          );
        }
      },
    );

    //*this is supposed to ensure that all items in the list have a price.
    //*But at this point the game economy has not been worked out so there are no prices
    //*The moment prices are added this should fail so you need to:
    //! change it to check that all base prices are greater than the least priced item.
    test(
      "every car base price is 0",
      () {
        for (var truck in trucks) {
          expect(
            truck.basePrice,
            0,
            reason: "Cause: ${truck.name}",
          );
        }
      },
    );
  });
}
