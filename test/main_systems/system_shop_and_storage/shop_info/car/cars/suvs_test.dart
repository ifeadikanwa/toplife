import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/car_quality.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/car_type.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/shop_info/car/cars/suvs.dart';

void main() {
  group("SUV:", () {
    test(
      "every car name is at least 5 letters",
      () {
        for (var suv in suvs) {
          expect(
            suv.name.trim().length,
            greaterThanOrEqualTo(5),
            reason: "Cause: $suv",
          );
        }
      },
    );

    test(
      "there are at least 7 cars in the list",
      () {
        expect(suvs.length, greaterThanOrEqualTo(7));
      },
    );

    test(
      "every car type is a suv",
      () {
        for (var suv in suvs) {
          expect(
            suv.type,
            CarType.suv.name,
            reason: "Cause: ${suv.name}",
          );
        }
      },
    );

    test(
      "every car percentage travel time is greater than 0",
      () {
        for (var suv in suvs) {
          expect(
            suv.percentageOfTravelTime,
            greaterThan(0),
            reason: "Cause: ${suv.name}",
          );
        }
      },
    );

    test(
      "every car percentage travel time is in the range 55 - 70",
      () {
        for (var suv in suvs) {
          expect(
            suv.percentageOfTravelTime,
            inInclusiveRange(55, 70),
            reason: "Cause: ${suv.name}",
          );
        }
      },
    );

    test(
      "every car quality is low, mid or high",
      () {
        for (var suv in suvs) {
          expect(
            suv.quality,
            isIn([
              CarQuality.high.name,
              CarQuality.mid.name,
              CarQuality.low.name,
            ]),
            reason: "Cause: ${suv.name}",
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
        for (var suv in suvs) {
          expect(
            suv.basePrice,
            0,
            reason: "Cause: ${suv.name}",
          );
        }
      },
    );
  });
}
