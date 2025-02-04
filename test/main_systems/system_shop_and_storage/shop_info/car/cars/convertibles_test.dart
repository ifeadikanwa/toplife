import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/car_quality.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/car_type.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/shop_info/car/cars/convertibles.dart';

void main() {
  group("Convertibles:", () {
    test(
      "every car name is at least 5 letters",
      () {
        for (var convertible in convertibles) {
          expect(
            convertible.name.trim().length,
            greaterThanOrEqualTo(5),
            reason: "Cause: $convertible",
          );
        }
      },
    );

    test(
      "there are at least 7 cars in the list",
      () {
        expect(convertibles.length, greaterThanOrEqualTo(7));
      },
    );

    test(
      "every car type is a convertible",
      () {
        for (var convertible in convertibles) {
          expect(
            convertible.type,
            CarType.convertible.name,
            reason: "Cause: ${convertible.name}",
          );
        }
      },
    );

    test(
      "every car percentage travel time is greater than 0",
      () {
        for (var convertible in convertibles) {
          expect(
            convertible.percentageOfTravelTime,
            greaterThan(0),
            reason: "Cause: ${convertible.name}",
          );
        }
      },
    );

    test(
      "every car percentage travel time is in the range 40 - 50",
      () {
        for (var convertible in convertibles) {
          expect(
            convertible.percentageOfTravelTime,
            inInclusiveRange(40, 50),
            reason: "Cause: ${convertible.name}",
          );
        }
      },
    );

    test(
      "every car quality is high or mid",
      () {
        for (var convertible in convertibles) {
          expect(
            convertible.quality,
            isIn([
              CarQuality.high.name,
              CarQuality.mid.name,
            ]),
            reason: "Cause: ${convertible.name}",
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
        for (var convertible in convertibles) {
          expect(
            convertible.basePrice,
            0,
            reason: "Cause: ${convertible.name}",
          );
        }
      },
    );
  });
}
