import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/car_quality.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/car_type.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/shop_info/car/cars/minivans.dart';

void main() {
  group("Minivans:", () {
    test(
      "every car name is at least 5 letters",
      () {
        for (var minivan in minivans) {
          expect(
            minivan.name.trim().length,
            greaterThanOrEqualTo(5),
            reason: "Cause: $minivan",
          );
        }
      },
    );

    test(
      "there are at least 7 cars in the list",
      () {
        expect(minivans.length, greaterThanOrEqualTo(7));
      },
    );

    test(
      "every car type is a minivan",
      () {
        for (var minivan in minivans) {
          expect(
            minivan.type,
            CarType.minivan.name,
            reason: "Cause: ${minivan.name}",
          );
        }
      },
    );

    test(
      "every car percentage travel time is greater than 0",
      () {
        for (var minivan in minivans) {
          expect(
            minivan.percentageOfTravelTime,
            greaterThan(0),
            reason: "Cause: ${minivan.name}",
          );
        }
      },
    );

    test(
      "every car percentage travel time is in the range 60 - 80",
      () {
        for (var minivan in minivans) {
          expect(
            minivan.percentageOfTravelTime,
            inInclusiveRange(60, 80),
            reason: "Cause: ${minivan.name}",
          );
        }
      },
    );

    test(
      "every car quality is low or mid",
      () {
        for (var minivan in minivans) {
          expect(
            minivan.quality,
            isIn([
              CarQuality.low.name,
              CarQuality.mid.name,
            ]),
            reason: "Cause: ${minivan.name}",
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
        for (var minivan in minivans) {
          expect(
            minivan.basePrice,
            0,
            reason: "Cause: ${minivan.name}",
          );
        }
      },
    );
  });
}
