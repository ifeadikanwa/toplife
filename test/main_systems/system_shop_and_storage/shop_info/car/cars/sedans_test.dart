import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_quality.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/car_type.dart';
import 'package:toplife/main_systems/system_shop_and_storage/shop_info/car/cars/sedans.dart';

void main() {
  group("Sedans:", () {
    test(
      "every car name is at least 5 letters",
      () {
        for (var sedan in sedans) {
          expect(
            sedan.name.trim().length,
            greaterThanOrEqualTo(5),
            reason: "Cause: $sedan",
          );
        }
      },
    );

    test(
      "there are at least 7 cars in the list",
      () {
        expect(sedans.length, greaterThanOrEqualTo(7));
      },
    );

    test(
      "every car type is a sedan",
      () {
        for (var sedan in sedans) {
          expect(
            sedan.type,
            CarType.sedan.name,
            reason: "Cause: ${sedan.name}",
          );
        }
      },
    );

    test(
      "every car percentage travel time is greater than 0",
      () {
        for (var sedan in sedans) {
          expect(
            sedan.percentageOfTravelTime,
            greaterThan(0),
            reason: "Cause: ${sedan.name}",
          );
        }
      },
    );

    test(
      "every car percentage travel time is in the range 55 - 70",
      () {
        for (var sedan in sedans) {
          expect(
            sedan.percentageOfTravelTime,
            inInclusiveRange(55, 70),
            reason: "Cause: ${sedan.name}",
          );
        }
      },
    );

    test(
      "every car quality is low, mid or high",
      () {
        for (var sedan in sedans) {
          expect(
            sedan.quality,
            isIn([
              CarQuality.high.name,
              CarQuality.mid.name,
              CarQuality.low.name,
            ]),
            reason: "Cause: ${sedan.name}",
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
        for (var sedan in sedans) {
          expect(
            sedan.basePrice,
            0,
            reason: "Cause: ${sedan.name}",
          );
        }
      },
    );
  });
}
